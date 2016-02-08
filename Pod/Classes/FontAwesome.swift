import Foundation

public enum FontAwesome : String {

    case FA500Px = "\u{f26e}"
    case FAAdjust = "\u{f042}"
}

extension FontAwesome: FontEnum {

    public func fontName() ->  String{
        return "FontAwesome"
    }

    public func bundleName() ->  String{
        return "FontAwesome.bundle"
    }

    public func unicode() ->  String{
        return self.rawValue
    }

    public func error() ->  String{
        return "Font: \(fontName()).ttf was NOT found!"
    }
}

