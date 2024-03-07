<?php

namespace App\Http\Controllers\User;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Models\Game;
use App\Models\GameLog;
use App\Models\GuessBonus;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PlayController extends Controller {

    public function playGame($alias) {
        $game      = Game::where('alias', $alias)->firstOrFail();
        $pageTitle = "Play " . $game->name;
        return view($this->activeTemplate . 'user.games.' . $alias, compact('game', 'pageTitle'));
    }

    public function investGame(Request $request, $alias) {
        $game       = Game::where('alias', $alias)->firstOrFail();
        $aliasName  = str_replace('_', ' ', $alias);
        $methodName = 'play' . str_replace(' ', '', ucwords($aliasName));
        return $this->$methodName($game, $request);
    }

    public function gameEnd(Request $request, $alias) {
        $game       = Game::where('alias', $alias)->firstOrFail();
        $aliasName  = str_replace('_', ' ', $alias);
        $methodName = 'gameEnd' . str_replace(' ', '', ucwords($aliasName));
        return $this->$methodName($game, $request);
    }

    public function playHeadTail($game, $request) {
        $validator = $this->investValidation($request, 'head,tail');

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $user = auth()->user();

        $fallback = $this->fallback($request, $user, $game);

        if (@$fallback['error']) {

            return response()->json($fallback);
        }

        $random = mt_rand(0, 100);

        if ($random <= $game->probable_win) {
            $win    = Status::WIN;
            $result = $request->choose;
        } else {
            $win    = Status::LOSS;
            $result = $request->choose == 'head' ? 'tail' : 'head';
        }

        $invest = $this->invest($user, $request, $game, $result, $win);

        $res['game_id'] = $invest['game_log']->id;
        $res['balance'] = $user->balance;
        return response()->json($res);
    }

    public function gameEndHeadTail($game, $request) {
        $validator = $this->endValidation($request);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $gameLog = $this->runningGame();

        if (!$gameLog) {
            return response()->json(['error' => 'Game Logs not found']);
        }

        $res = $this->gameResult($game, $gameLog);

        return response()->json($res);
    }

    public function playRockPaperScissors($game, $request) {

        $validator = $this->investValidation($request, 'rock,paper,scissors');

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $user = auth()->user();

        $game     = Game::where('alias', 'rock_paper_scissors')->first();
        $fallback = $this->fallback($request, $user, $game);

        if (@$fallback['error']) {
            return response()->json($fallback);
        }

        $userChoose = $request->choose;
        $random     = mt_rand(0, 100);

        if ($random <= $game->probable_win) {
            $win = 1;

            if ($userChoose == 'rock') {
                $result = 'scissors';
            }

            if ($userChoose == 'paper') {
                $result = 'rock';
            }

            if ($userChoose == 'scissors') {
                $result = 'paper';
            }

        } else {
            $win = 0;

            if ($userChoose == 'rock') {
                $result = 'paper';
            }

            if ($userChoose == 'paper') {
                $result = 'scissors';
            }

            if ($userChoose == 'scissors') {
                $result = 'rock';
            }

        }

        $invest = $this->invest($user, $request, $game, $result, $win);

        $res['game_id'] = $invest['game_log']->id;
        $res['balance'] = $user->balance;
        return response()->json($res);

    }

    public function gameEndRockPaperScissors($game, $request) {
        $validator = $this->endValidation($request);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $gameLog = $this->runningGame();

        if (!$gameLog) {
            return response()->json(['error' => 'Game Logs not found']);
        }

        $res = $this->gameResult($game, $gameLog);

        return response()->json($res);
    }

    /*
     * Spin Wheel
     */

    public function playSpinWheel($game, $request) {
        $validator = $this->investValidation($request, 'red,blue');

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $user     = auth()->user();
        $fallback = $this->fallback($request, $user, $game);

        if (@$fallback['error']) {
            return response()->json($fallback);
        }

        $random = mt_rand(0, 100);

        if ($random <= $game->probable_win) {
            $win    = Status::WIN;
            $result = $request->choose;
        } else {
            $win    = Status::LOSS;
            $result = $request->choose == 'blue' ? 'red' : 'blue';
        }

        $invest = $this->invest($user, $request, $game, $result, $win);

        $res['game_id'] = $invest['game_log']->id;
        $res['invest']  = $request->invest;
        $res['result']  = $result;
        $res['balance'] = $user->balance;
        return response()->json($res);
    }

    public function gameEndSpinWheel($game, $request) {
        $validator = $this->endValidation($request);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $gameLog = $this->runningGame();

        if (!$gameLog) {
            return response()->json(['error' => 'Game Logs not found']);
        }

        $res = $this->gameResult($game, $gameLog);

        return response()->json($res);
    }

    /*
     * Number Guess
     */

    public function playNumberGuess($game, $request) {
        $validator = Validator::make($request->all(), [
            'invest' => 'required|numeric|gt:0',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $user = auth()->user();

        $fallback = $this->fallback($request, $user, $game);

        if (@$fallback['error']) {
            return response()->json($fallback);
        }

        $num = mt_rand(1, 100);

        $invest = $this->invest($user, $request, $game, $num, 0);

        $res['game_id'] = $invest['game_log']->id;
        $res['invest']  = $request->invest;
        $res['balance'] = $user->balance;

        return response()->json($res);
    }

    public function gameEndNumberGuess($game, $request) {

        $validator = Validator::make($request->all(), [
            'game_id' => 'required',
            'number'  => 'required|integer',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        if ($request->number < 1 || $request->number > 100) {
            return response()->json(['error' => 'Enter a number between 1 and 100']);
        }

        $user    = auth()->user();
        $gameLog = $this->runningGame();

        if (!$gameLog) {
            return response()->json(['error' => 'Game Logs not found']);
        }

        if ($gameLog->user_select != null) {
            $userSelect = json_decode($gameLog->user_select);
            array_push($userSelect, $request->number);
        } else {
            $userSelect[] = $request->number;
        }

        $data  = GuessBonus::get();
        $count = $data->count();

        if ($gameLog->status == 1) {
            $mes['gameSt']  = 1;
            $mes['message'] = 'Time Over';
            return response()->json($mes);
        }

        $gameLog->try         = $gameLog->try + 1;
        $gameLog->user_select = json_encode($userSelect);

        if ($gameLog->try >= $count) {
            $gameLog->status = Status::ENABLE;
        }

        $gameLog->save();

        $bonus  = GuessBonus::where('chance', $gameLog->try)->first()->percent;
        $amount = $gameLog->invest * $bonus / 100;

        $user = auth()->user();
        $game = Game::find($gameLog->game_id);

        $result = $gameLog->result;

        if ($request->number < $result) {
            $mes['message'] = 'The Number is short';
            $win            = Status::LOSS;
            $mes['type']    = 0;
        }

        if ($request->number > $result) {
            $mes['message'] = 'The Number is high';
            $win            = Status::LOSS;
            $mes['type']    = 1;
        }

        if ($gameLog->status == 1) {
            $mes['gameSt']  = 1;
            $mes['message'] = 'Oops You Lost! The Number was ' . $gameLog->result;
        } else {
            $nextBonus   = GuessBonus::find($gameLog->try + 1);
            $mes['data'] = $nextBonus->percent . '%';
        }

        if ($request->number == $result) {

            $gameLog->win_status = Status::WIN;
            $gameLog->status     = Status::ENABLE;
            $gameLog->win_amo    = $amount;
            $gameLog->save();

            $user->balance += $amount;
            $user->save();

            $transaction               = new Transaction();
            $transaction->user_id      = $user->id;
            $transaction->amount       = $amount;
            $transaction->charge       = 0;
            $transaction->trx_type     = '+';
            $transaction->details      = $bonus . '% Bonus For Number Guessing Game';
            $transaction->remark       = 'Win_Bonus';
            $transaction->trx          = getTrx();
            $transaction->post_balance = $user->balance;
            $transaction->save();

            $mes['gameSt']  = 1;
            $mes['message'] = 'This is the number';
        }

        $mes['bal'] = $user->balance;
        return response()->json($mes);

    }

    /*
     * Dice Rolling
     */
    public function playDiceRolling($game, $request) {

        $validator = $this->investValidation($request, '1,2,3,4,5,6');

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $user = auth()->user();

        $fallback = $this->fallback($request, $user, $game);

        if (@$fallback['error']) {
            return response()->json($fallback);
        }

        $random = mt_rand(0, 100);

        if ($random <= $game->probable_win) {
            $win    = Status::WIN;
            $result = $request->choose;
        } else {
            $win = Status::LOSS;

            for ($i = 0; $i < 100; $i++) {
                $randWin = rand(1, 6);

                if ($randWin != $request->choose) {
                    $result = $randWin;
                    break;
                }

            }

        }

        $invest = $this->invest($user, $request, $game, $result, $win);

        $res['game_id'] = $invest['game_log']->id;
        $res['result']  = $result;
        $res['balance'] = $user->balance;
        return response()->json($res);
    }

    public function gameEndDiceRolling($game, $request) {
        $validator = $this->endValidation($request);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $gameLog = $this->runningGame();

        if (!$gameLog) {
            return response()->json(['error' => 'Game Logs not found']);
        }

        $res = $this->gameResult($game, $gameLog);

        return response()->json($res);
    }

    /*
     * Card Finding
     */

    public function playCardFinding($game, $request) {

        $validator = $this->investValidation($request, 'black,red');

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $user = auth()->user();

        $fallback = $this->fallback($request, $user, $game);

        if (@$fallback['error']) {
            return response()->json($fallback);
        }

        $random = mt_rand(0, 100);

        if ($random <= $game->probable_win) {
            $win    = Status::WIN;
            $result = $request->choose;
        } else {
            $win    = Status::LOSS;
            $result = $request->choose == 'black' ? 'red' : 'black';
        }

        $invest = $this->invest($user, $request, $game, $result, $win);

        $res['game_id'] = $invest['game_log']->id;
        $res['result']  = $result;
        $res['balance'] = $user->balance;
        return response()->json($res);
    }

    public function gameEndCardFinding($game, $request) {
        $validator = $this->endValidation($request);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $gameLog = $this->runningGame();

        if (!$gameLog) {
            return response()->json(['error' => 'Game Logs not found']);
        }

        $res = $this->gameResult($game, $gameLog);

        return response()->json($res);
    }

    /*
     * Number Slot
     */

    public function PlayNumberSlot($game, $request) {
        $validator = $this->investValidation($request, '0,1,2,3,4,5,6,7,8,9');

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $user = auth()->user();

        $fallback = $this->fallback($request, $user, $game);

        if (@$fallback['error']) {
            return response()->json($fallback);
        }

        $random = mt_rand(1, 100);

        if ($game->probable_win[0] > $random) {
            $result = numberSlotResult(0, $request->choose);
            $win    = 0;
        } elseif ($game->probable_win[0] + $game->probable_win[1] > $random) {
            $result = numberSlotResult(1, $request->choose);
            $win    = 1;
        } elseif ($game->probable_win[0] + $game->probable_win[1] + $game->probable_win[3] > $random) {
            $result = numberSlotResult(2, $request->choose);
            $win    = 2;
        } else {
            $result = numberSlotResult(3, $request->choose);
            $win    = 3;
        }

        $invest = $this->invest($user, $request, $game, $result, $win);

        $res['game_id'] = $invest['game_log']->id;
        $res['number']  = $result;
        $res['win']     = $win;
        $res['balance'] = $user->balance;
        return response()->json($res);
    }

    public function gameEndNumberSlot($game, $request) {
        $validator = $this->endValidation($request);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $user    = auth()->user();
        $gameLog = $this->runningGame();

        if (!$gameLog) {
            return response()->json(['error' => 'Game Logs not found']);
        }

        $winner = 0;
        $trx    = getTrx();

        foreach ($game->level as $key => $data) {

            if ($gameLog->win_status == $key + 1) {
                $winBon = $gameLog->invest * $game->level[$key] / 100;
                $amo    = $winBon;
                $user->balance += $amo;
                $user->save();

                $gameLog->win_amo = $amo;
                $gameLog->save();

                $winner = 1;
                $lev    = $key + 1;

                $transaction               = new Transaction();
                $transaction->user_id      = $user->id;
                $transaction->amount       = $winBon;
                $transaction->charge       = 0;
                $transaction->trx_type     = '+';
                $transaction->details      = $game->level[$key] . '% Win bonus of Number Slot Game ' . $lev . ' Time';
                $transaction->remark       = 'win_bonus';
                $transaction->trx          = $trx;
                $transaction->post_balance = $user->balance;
                $transaction->save();
            }

        }

        if ($winner == 1) {
            $res['user_choose'] = $gameLog->user_select;
            $res['message']     = 'Yahoo! You Win for ' . $gameLog->win_status . ' Time !!!';
            $res['type']        = 'success';
            $res['bal']         = $user->balance;
        } else {
            $res['user_choose'] = $gameLog->user_select;
            $res['message']     = 'Oops! You Lost!!';
            $res['type']        = 'danger';
            $res['bal']         = $user->balance;
        }

        $gameLog->status = Status::ENABLE;
        $gameLog->save();

        return response()->json($res);
    }

    /*
     * Pool Number
     */
    public function playNumberPool($game, $request) {
        $validator = $this->investValidation($request, '1,2,3,4,5,6,7,8');

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $user = auth()->user();

        $fallback = $this->fallback($request, $user, $game);

        if (@$fallback['error']) {
            return response()->json($fallback);
        }

        $random = mt_rand(0, 100);
        $result = 8;

        if ($random <= $game->probable_win) {
            $win    = Status::ENABLE;
            $result = $request->choose;
        } else {
            $win = Status::DISABLE;

            for ($i = 0; $i < 100; $i++) {
                $randWin = rand(1, 8);

                if ($randWin != $request->choose) {
                    $result = $randWin;
                    break;
                }

            }

        }

        $invest = $this->invest($user, $request, $game, $result, $win);

        $res['game_id'] = $invest['game_log']->id;

        $res['invest']  = $request->invest;
        $res['result']  = $result;
        $res['win']     = $win;
        $res['balance'] = $user->balance;
        return response()->json($res);
    }

    public function gameEndNumberPool($game, $request) {
        $validator = $this->endValidation($request);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $gameLog = $this->runningGame();

        if (!$gameLog) {
            return response()->json(['error' => 'Game Logs not found']);
        }

        $res = $this->gameResult($game, $gameLog);
        return response()->json($res);
    }

    public function investValidation($request, $in) {
        return Validator::make($request->all(), [
            'invest' => 'required|numeric|gt:0',
            'choose' => 'required|in:' . $in,
        ]);
    }

    public function fallback($request, $user, $game) {

        if ($request->invest > $user->balance) {
            return ['error' => 'Oops! You have no sufficient balance'];
        }

        $running = GameLog::where('status', 0)->where('user_id', $user->id)->where('game_id', $game->id)->first();

        if ($running) {
            return ['error' => '1 game is in-complete. Please wait'];
        }

        if ($request->invest > $game->max_limit) {
            return ['error' => 'Please follow the maximum limit of invest'];
        }

        if ($request->invest < $game->min_limit) {
            return ['error' => 'Please follow the minimum limit of invest'];
        }

        return ['success'];
    }

    public function invest($user, $request, $game, $result, $win) {
        $user->balance -= $request->invest;
        $user->save();

        $transaction               = new Transaction();
        $transaction->user_id      = $user->id;
        $transaction->amount       = $request->invest;
        $transaction->charge       = 0;
        $transaction->trx_type     = '-';
        $transaction->details      = 'Invest to ' . $game->name;
        $transaction->remark       = 'invest';
        $transaction->trx          = getTrx();
        $transaction->post_balance = $user->balance;
        $transaction->save();

        $gameLog              = new GameLog();
        $gameLog->user_id     = $user->id;
        $gameLog->game_id     = $game->id;
        $gameLog->user_select = $request->choose;
        $gameLog->result      = $game->alias == 'number_slot' ? json_encode($result) : $result;
        $gameLog->status      = 0;
        $gameLog->win_status  = $win;
        $gameLog->invest      = $request->invest;
        $gameLog->save();

        return [
            'game_log' => $gameLog,
        ];
    }

    public function endValidation($request) {
        return Validator::make($request->all(), [
            'game_id' => 'required',
        ]);
    }

    public function runningGame() {
        return GameLog::where('user_id', auth()->id())->where('id', request()->game_id)->first();
    }

    public function gameResult($game, $gameLog) {
        $trx  = getTrx();
        $user = auth()->user();

        if ($gameLog->win_status == Status::WIN) {
            $winBon     = $gameLog->invest * $game->win / 100;
            $amount     = $winBon;
            $investBack = 0;

            if ($game->invest_back == 1) {
                $investBack = $gameLog->invest;
                $user->balance += $gameLog->invest;
                $user->save();

                $transaction               = new Transaction();
                $transaction->user_id      = $user->id;
                $transaction->amount       = $investBack;
                $transaction->charge       = 0;
                $transaction->trx_type     = '+';
                $transaction->details      = 'Invest Back For ' . $game->name;
                $transaction->remark       = 'invest_back';
                $transaction->trx          = $trx;
                $transaction->post_balance = $user->balance;
                $transaction->save();
            }

            $user->balance += $amount;
            $user->save();

            $gameLog->win_amo = $amount;
            $gameLog->save();

            $transaction               = new Transaction();
            $transaction->user_id      = $user->id;
            $transaction->amount       = $winBon;
            $transaction->charge       = 0;
            $transaction->trx_type     = '+';
            $transaction->details      = 'Win bonus of ' . $game->name;
            $transaction->remark       = 'Win_Bonus';
            $transaction->trx          = $trx;
            $transaction->post_balance = $user->balance;
            $transaction->save();

            $res['message'] = 'Yahoo! You Win!!!';
            $res['type']    = 'success';
        } else {
            $res['message'] = 'Oops! You Lost!!';
            $res['type']    = 'danger';

        }

        $res['result']      = $gameLog->result;
        $res['user_choose'] = $gameLog->user_select;
        $res['bal']         = $user->balance;

        $gameLog->status = Status::ENABLE;
        $gameLog->save();

        return $res;
    }

}
