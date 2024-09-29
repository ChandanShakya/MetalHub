<div>
    <x-top-products-banner />

    <div class="max-w-screen-xl px-4 py-12 mx-auto space-y-12 sm:px-6 lg:px-8">
            <section>
                <div class="grid grid-cols-2 mt-8 lg:grid-cols-4 gap-x-4 gap-y-8">
                    @foreach ($products as $product)
                        <x-product-card :product="$product->product" />
                    @endforeach
                </div>
            </section>
    </div>
</div>
