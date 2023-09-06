fields @timestamp, @message
| filter @message like /\["GET-ACTIONS: CHANGES-FOUND/
# and @message like /CROSSTALK-FOUND/
| parse @message /\"channelUrl\":\"(?<channelUrl>.*?)\"/ 
| parse @message /\"supportId\":\"(?<supportId>.*?)\"/
| parse /createChannel\"(?<createChannel>.*?)\"/
| parse /crossTalkChannel\"(?<crossTalkChannel>.*?)\"/ 
| parse /deleteChannel\"(?<deleteChannel>.*?)\"/
| parse /freezeChannel\"(?<freezeChannel>.*?)\"/
| parse /unFreezeChannel\"(?<unFreezeChannel>.*?)\"/
| parse /updateChannelName\"(?<updateChannelName>.*?)\"/
| parse /updateChannelType\"(?<updateChannelType>.*?)\"/
| parse /updateSupportId\"(?<updateSupportId>.*?)\"/
| sort @timestamp desc
| limit 10000