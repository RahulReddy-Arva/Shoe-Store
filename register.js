$(document).ready(function() {
    $('#shipping-billing-checkbox').change(function() {
        if (this.checked) {
            $('#shippingAddress').val( $('#billingAddress').val() )
        } else {
            $('#shippingAddress').val('');
        }
    });

    $('#birthDate').datetimepicker({
        format: 'YYYY-MM-DD'
    });

});