App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },
  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },
  received: function(data) {
    return $('#bms_messages').append(
      '<div class="bms_message bms_left id="new-message">' +
        '<div class="bms_message_box">' +
          '<div class="bms_message_content">' +
            '<span>' + data['user_name'] +':</span>' +
            '<div class="bms_message_text">' + data['message'] + '</div>' +
          '</div>' +
        '</div>' +
      '</div>' +
      '<div class="bms_clear"></div>'
    );
  },
  post: function(message) {
    return this.perform('post', { message: message[0], user_id: message[1], user_name: message[2], chat_id: message[3] });
  },
},
$(document).on('keypress', '[data-behavior~=chat_post]', function(event) {
  if (event.keyCode === 13) {
    var chatForm = $('#chat-form');
    var userId = $('#user-id-value');
    var userName = $('#user-name-value');
    var chatId = $('#chat-id-value');
    App.chat.post([chatForm.val(), userId.val(), userName.val(), chatId.val()]);
    return chatForm.val('');
  }
}));
