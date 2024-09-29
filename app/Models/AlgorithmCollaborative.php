<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AlgorithmCollaborative extends Model
{
    use HasFactory;
    protected $fillable = ['product_id', 'filtering_value'];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
