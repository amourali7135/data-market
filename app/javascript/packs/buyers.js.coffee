# # $ ->
# #   if $('.pagination').length && $('#buyers').length
# #     $(window).scroll ->
# #       url = $('.pagination .next_page').attr('href')
# #       if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
# #         $('.pagination').text("Loading more buyers...")
# #         $.getScript(url)
# #     $(window).scroll()


#  if $('.pagination').length
#       $('#buyers_table').scroll ->
#               url = $('.pagination .next_page').attr('href')
#               if url &&  $('#buyers_table')[0].scrollHeight -
#               $('#buyers_table').scrollTop() < 700
#                       $('.pagination').text('Fetching more users...')
#                       $.getScript(url)
# $('#buyers_table').scroll()
