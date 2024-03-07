<?php

namespace App\Traits;

use Carbon\Carbon;

trait Searchable {

    /*
    |--------------------------------------------------------------------------
    | Search Data
    |--------------------------------------------------------------------------
    |
    | This trait basically used in model. This will help to implement search.
    | It could search in multiple column, date to date etc.
    | But this trait unable to make search with multiple table.
    |
     */

    public function scopeSearchable($query, $params, $like = true) {
        $search = request()->search;
        $search = $like ? "%$search%" : $search;

        foreach ($params as $key => $param) {
            $relationData = explode(':', $param);
            if (@$relationData[1]) {
                $query = $this->relationSearch($query, $relationData[0], $relationData[1], $search);
            } else {
                $column = $param;
                if ($key == 0) {
                    $query->where($column, 'LIKE', $search);
                } else {
                    $query->orWhere($column, 'LIKE', $search);
                }
            }

        }

        return $query;
    }

    public function scopeFilter($query, $params) {

        foreach ($params as $param) {
            $relationData = explode(':', $param);
            $filters      = array_keys(request()->all());
            if (@$relationData[1]) {
                $query = $this->relationFilter($query, $relationData[0], $relationData[1], $filters);
            } else {
                $column = $param;
                if (in_array($column, $filters) && request()->$column != null) {
                    $query->where($column, request()->$column);
                }
            }

        }
        return $query;
    }

    function scopeDateFilter($query, $column = 'created_at') {
        if (!request()->date) {
            return $query;
        }
        $date = explode('-', request()->date);

        $startDate = Carbon::parse(trim($date[0]))->format('Y-m-d');

        $endDate = @$date[1] ? Carbon::parse(trim(@$date[1]))->format('Y-m-d') : $startDate;

        request()->merge(['start_date' => $startDate, 'end_date' => $endDate]);

        request()->validate([
            'start_date' => 'required|date_format:Y-m-d',
            'end_date'   => 'nullable|date_format:Y-m-d',
        ]);

        return $query->whereDate($column, '>=', $startDate)->whereDate($column, '<=', $endDate);
    }

    private function relationSearch($query, $relation, $columns, $search) {
        foreach (explode(',', $columns) as $column) {
            $query->where(function ($myQ) use ($column, $search, $relation) {
                $myQ->orWhereHas($relation, function ($q) use ($column, $search) {
                    $q->where($column, 'LIKE', $search);
                });
            });
        }
        return $query;
    }

    private function relationFilter($query, $relation, $columns, $filters) {
        foreach (explode(',', $columns) as $column) {
            if (in_array($column, $filters) && request()->$column != null) {
                $query->whereHas($relation, function ($q) use ($column) {
                    $q->where($column, request()->$column);
                });
            }
        }
        return $query;
    }
}