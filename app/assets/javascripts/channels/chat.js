App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },
  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },
  received: function(data) {
    return $('#bms_messages').append(
      '<div class="bms_message bms_left>' +
        '<div class="bms_message_box">' +
          '<div class="bms_message_content">' +
            '<div class="bms_message_text">' + data['message'] + '</div>' +
          '</div>' +
        '</div>' +
      '</div>' +
      '<div class="bms_clear"></div>'
    );
  },
  post: function(message) {
    return this.perform('post', { message: message[0], user_id: message[1] });
  },
},
$(document).on('keypress', '[data-behavior~=chat_post]', function(event) {
  if (event.keyCode === 13) {
    var chatForm = $('#chat-form');
    var userId = $('#user-id-value')
    App.chat.post([chatForm.val(), userId.val()]);
    return chatForm.val('');
  }
}));
