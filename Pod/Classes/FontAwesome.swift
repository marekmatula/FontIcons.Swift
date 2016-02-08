import Foundation

public enum FontAwesome : String {

    case FA500Px = "\u{f26e}"
    case FAAdjust = "\u{f042}"
}

extension FontAwesome: FontEnum {

    public func fontName() ->  String{
        return "FontAwesome"
    }

    public func unicode() ->  String{
        return self.rawValue
    }

    public func error() ->  String{
        return "Font: \(fontName()).ttf was NOT found!"
    }

    public func loadFontIfNeeded(){
        struct Static {
            static var onceToken : dispatch_once_t = 0
        }

        dispatch_once(&Static.onceToken) {
            FontLoader.loadFont(self.fontName(), bundleName: "FontAwesome.bundle")
        }
    }
}

