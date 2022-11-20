package;

import spine.support.files.FileHandle;
import spine.support.utils.JsonValue;
import haxe.Json;

class JsonReader {

    public function new() {}

    inline public function parse(file:FileHandle):JsonValue {

        return new JsonDynamic(Json.parse(file.getContent()));

    }

    inline public static function parseString(str:String):JsonValue {

        return new JsonDynamic(Json.parse(str));

    }
    // (sirox) added that function because new spine is stupid
}
