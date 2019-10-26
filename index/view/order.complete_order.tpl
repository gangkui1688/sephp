<{include file="./public/header.tpl"}>


        <!--breadcumb area start -->
        <div class="breadcumb-area overlay pos-rltv">
            <div class="bread-main">
                <div class="bred-hading text-center">
                    <h5>订单详情</h5>
                </div>
            </div>
        </div>
        <!--breadcumb area end -->

        <!--cart-checkout-area start -->
        <div class="cart-checkout-area  pt-30">
            <div class="container">
                <div class="row">
                    <div class="product-area">
                        <div class="clearfix"></div>
                        <div class="col-sm-12">
                            <div class="content-tab-product-category pb-70">
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane  fade in active" id="complete-order">
                                    <div class="row">
                                        <div class="col-xs-12">
                                        <div class="checkout-payment-area">
                                            <div class="checkout-total mt20">
                                               <h3>订单明细</h3>
                                           <form action="#" method="post">
                                           <div class="table-responsive">
                                                <table class="checkout-area table">
                                               <thead>
                                                <tr class="cart_item check-heading">
                                                    <td class="ctg-type"> 商品</td>
                                                    <td class="cgt-des">  总计</td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <{foreach from=$data item=goods}>
                                                    <tr class="cart_item check-item prd-name">
                                                        <td class="ctg-type"> <{$goods.name}> × <span><{$goods.member_buy_num}></span></td>
                                                        <td class="cgt-des"> <{$goods.cost}></td>
                                                    </tr>
                                                    <{/foreach}>
                                                    <tr class="cart_item">
                                                        <td class="ctg-type"> Subtotal</td>
                                                        <td class="cgt-des">$2,052.00</td>
                                                    </tr>
                                                    <tr class="cart_item">
                                                        <td class="ctg-type">Shipping</td>
                                                            <td class="cgt-des ship-opt">
                                                                <div class="shipp">
                                                                    <input type="radio" id="pay-toggle" name="ship">
                                                                    <label for="pay-toggle">Flat Rate: <span>$03</span></label>
                                                                </div>
                                                                <div class="shipp">
                                                                    <input type="radio" id="pay-toggle2" name="ship">
                                                                    <label for="pay-toggle2">Free Shipping</label>
                                                                </div>
                                                         </td>
                                                    </tr>
                                                    <tr class="cart_item">
                                                        <td class="ctg-type crt-total"> Total</td>
                                                        <td class="cgt-des prc-total"> $ 2,055.00 </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                           </div>
                                        </form>
                                        </div>
                                            <div class="payment-section mt-20 clearfix">
                                                <div class="pay-toggle">
                                                    <form action="#">
                                                       <div class="pay-type-total">
                                                        <div class="pay-type">
                                                            <input type="radio" id="pay-toggle01" name="pay">
                                                            <label for="pay-toggle01">Direct Bank Transfer</label>
                                                        </div>
                                                        <div class="pay-type">
                                                            <input type="radio" id="pay-toggle02" name="pay">
                                                            <label for="pay-toggle02">Cheque Payment</label>
                                                        </div>
                                                        <div class="pay-type">
                                                            <input type="radio" id="pay-toggle03" name="pay">
                                                            <label for="pay-toggle03">Cash on Delivery</label>
                                                        </div>
                                                        <div class="pay-type">
                                                            <input type="radio" id="pay-toggle04" name="pay">
                                                            <label for="pay-toggle04">Paypal</label>
                                                        </div>
                                                        </div>
                                                        <div class="input-box mt-20">
                                                            <a class="btn-def btn2" href="#">Place order</a>
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--cart-checkout-area end-->




<{include file="./public/footer.tpl"}>
