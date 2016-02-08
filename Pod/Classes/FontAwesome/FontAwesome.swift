import Foundation

public enum FontAwesome : String {

    case FA500Px = "\u{f26e}"
    case FAAdjust = "\u{f042}"
}

public extension FontAwesome: FontEnum {

    func fontName() ->  String{
        return "FontAwesome"
    }

    func unicode() ->  String{
        return self.rawValue
    }

    func error() ->  String{
        return "Font: \(fontName()).ttf was NOT found!"
    }
}

