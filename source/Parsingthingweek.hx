package;

import openfl.utils.Assets;
import haxe.Json;
import utilities.CoolUtil;

typedef SwagWeek =
{
        var groupName:String;
        var pathName:String;
        var weeks:Array<SwagWeeks>;
}

typedef SwagWeeks =
{
        var imagepath:String;
        var songs:Array<String>;
	var characters:Array<String>;
        var weekTitle:String;
	var backgroundColor:Array<Int>;
        var difficulties:Array<String>;
}

class Parsingthingweek
{
	public static var currentLoadedWeeks:Map<String, SwagWeek> = [];
	public static var weeksList:Array<String> = [];

	public static function loadJsons(isStoryMode:Bool = false)
	{
		currentLoadedWeeks.clear();
		weeksList = [];

		final list:Array<String> = CoolUtil.coolTextFile(Paths.txt('storyWeekList'));
		for (i in 0...list.length)
		{
			if (!currentLoadedWeeks.exists(list[i]))
			{
				var week:SwagWeek = parseJson(Paths.json('week data/' + list[i]));
				if (week != null)
			        {
					currentLoadedWeeks.set(list[i], week);
					weeksList.push(list[i]);
				}
			}
		}
	}

	public static function parseJson(path:String):SwagWeek
	{
		var rawJson:String = null;

		if (Assets.exists(path))
			rawJson = Assets.getText(path);

		return Json.parse(rawJson);
	}
}

