<?php

namespace App\Http\Controllers;

use App\Constants\Status;
use App\Models\GameLog;
use App\Models\Transaction;

class CronController extends Controller {

    public function cron() {
        $games              = GameLog::where('status', Status::DISABLE)->get();
        $general            = gs();
        $general->last_cron = now();
        $general->save();

        foreach ($games as $game) {

            if ($game->created_at->addMinutes(2) > now()) {
                continue;
            }

            $user = $game->user;
            $user->balance += $game->invest;
            $user->save();

            $transaction               = new Transaction();
            $transaction->user_id      = $user->id;
            $transaction->amount       = $game->invest;
            $transaction->charge       = 0;
            $transaction->trx_type     = '+';
            $transaction->details      = 'In-complete game invest return';
            $transaction->remark       = 'invest_return';
            $transaction->trx          = getTrx();
            $transaction->post_balance = $user->balance;
            $transaction->save();

            $game->status = 2;
            $game->save();
        }

        echo 'EXECUTED';

    }

}
