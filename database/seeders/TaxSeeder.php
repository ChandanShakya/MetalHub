<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Lunar\Models\Country;
use Lunar\Models\TaxClass;
use Lunar\Models\TaxRate;
use Lunar\Models\TaxZone;
use Lunar\Models\TaxZoneCountry;

class TaxSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     */
    public function run(): void
    {
        $taxClass = TaxClass::first();

        $npCountry = Country::firstWhere('iso3', 'NPL');

        $npTaxZone = TaxZone::factory()->create([
            'name' => 'NPL',
            'active' => true,
            'default' => true,
            'zone_type' => 'country',
        ]);

        TaxZoneCountry::factory()->create([
            'country_id' => $npCountry->id,
            'tax_zone_id' => $npTaxZone->id,
        ]);

        $npRate = TaxRate::factory()->create([
            'name' => 'VAT',
            'tax_zone_id' => $npTaxZone->id,
            'priority' => 1,
        ]);

        $npRate->taxRateAmounts()->createMany([
            [
                'percentage' => 13,
                'tax_class_id' => $taxClass->id,
            ],
        ]);
    }
}
