// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../js/emojihelper.js" as EmojiHelper;
import "../../common/js/Global.js"as Helpers;
import "../../common/js/settings.js" as MySettings
import QtQuick 1.1
import com.nokia.meego 1.0

Flickable{
    id: emojiGrid

    property int w_portrait:8;
    property int w_landscape: 14
    
    property int recentCount: 0
    property string emojilist: MySettings.getSetting("RecentEmoji", "")

    contentHeight:h*emojiHeight
    property int w:appWindow.inPortrait?w_portrait:w_landscape;
    property int h: Math.ceil(recentCount/w)
    property int emojiWidth:Math.floor(parent.width/w);
    property int emojiHeight:emojiWidth;
    x: (width-(w*emojiWidth))/2

    visible:false
    clip: true

    state:screen.currentOrientation == Screen.Portrait?"Portrait":"Landscape"

    onStateChanged: {
        if(visible){
            showEmoji();
        }
    }

    function loadEmoji(){
	var emoji = []
	if (emojilist!="")
		emoji = emojilist.split(',')
	
	recentCount = emoji.length
	h= Math.ceil(recentCount/w)
      
        _loadPortrait();
        _loadLandscape();
    }

    // if(!initializationDone){
      //   splashPage.setSubOperation(curr+"/"+(end-start))
        // breathe();
     //}
    function _loadLandscape()
    {
	emojilist= MySettings.getSetting("RecentEmoji", "")
	
	var emoji = []
	if (emojilist!="")
		emoji = emojilist.split(',')
	recentCount = emoji.length
	h= Math.ceil(recentCount/w)
	
        var rows= recentCount ? Math.ceil(recentCount/w_landscape) : 1;
        var emojiSet = EmojiHelper.emoji_landscape;
	
	var curr = 1;
	for (var i=0; i<rows; i++)
	{
		emojiSet[i] = new Array();

		for(var j=0; j<w_landscape; j++)
		{
			if(emoji.length === 0)
			    return
			var emote = emoji.pop();
			emojiSet[i][j] = EmojiHelper.addEmoji(emote, get32(emote));
			emojiSet[i][j].landscape = true
		}
	}
    }

    function _loadPortrait(){
	emojilist= MySettings.getSetting("RecentEmoji", "")
	
	var emoji = []
	if (emojilist!="")
		emoji = emojilist.split(',')
	recentCount = emoji.length
	h= Math.ceil(recentCount/w)
	
        var rows= recentCount ? Math.ceil(recentCount/w_portrait) : 1;
        var emojiSet = EmojiHelper.emoji;

	var curr = 1;
	for (var i=0; i<rows; i++)
	{
		emojiSet[i] = new Array();

		for(var j=0; j<w_portrait; j++)
		{
			if(emoji.length === 0)
			    return
			var emote = emoji.pop();
			emojiSet[i][j] =   EmojiHelper.addEmoji(emote, get32(emote));
			emojiSet[i][j].landscape = false
		}
	}
    }


    function showEmoji(){

        //var emojiSet = appWindow.inPortrait?EmojiHelper.emoji:EmojiHelper.emoji_landscape;

        //if(!emojiSet.length)
            if(appWindow.inPortrait)_loadPortrait(); else _loadLandscape();
	    var emojiSet = appWindow.inPortrait?EmojiHelper.emoji:EmojiHelper.emoji_landscape;

          emojiGrid.visible = true;

	  var curr = 1;
          for (var i=0; i<h; i++){
               for(var j=0; j<w; j++){
			if(curr > recentCount)
				return

                        var emoji = emojiSet[i][j];
                        emoji.x = 0;
                        emoji.y = 0;

                        emoji.spawned = true
                        emoji.x = j*emojiWidth;
                        emoji.y = i*emojiHeight;

                        emoji.spawned = false
			curr++
               }
          }
    }
}
