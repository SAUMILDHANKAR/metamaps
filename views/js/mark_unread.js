$('#notification-{ @notification.id } .notification-read-unread > a')
  .text('mark as read')
  .attr('href', '{ mark_read_notification_path(@notification.id) }')
$('#notification-{ @notification.id }')
  .removeClass('read')
  .addClass('unread')
Metamaps.GlobalUI.Notifications.incrementUnread(Metamaps.GlobalUI.ReactApp.render)