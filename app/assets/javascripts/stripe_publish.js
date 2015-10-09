// This identifies your website in the createToken call below
Stripe.setPublishableKey('pk_test_YW6ibbX7J5LPbpU1mFQuC0lV');
jQuery(function($) {
  $('#payment-form').submit(function(event) {
    event.preventDefault();
    var $form = $(this);
    // Disable the submit button to prevent repeated clicks
    $form.find('button').prop('disabled', true);

    Stripe.card.createToken($form, stripeResponseHandler);

    // Prevent the form from submitting with the default action
    return false;
  });
});

function stripeResponseHandler(status, response) {
  var $form = $('#payment-form');

  if (response.error) {
    // Show the errors on the form
    $form.find('.payment-errors').html('<p>' + response.error.message + '</p>');
    $form.find('button').prop('disabled', false);
    console.log(response.id);
  } else {
    // response contains id and card, which contains additional card details
    var token = response.id;
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="stripeToken" />').val(token));
    // and submit
    $form.get(0).submit();
  }
};
