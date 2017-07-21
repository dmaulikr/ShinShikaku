// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import UIKit

extension UIColor {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}

extension UIColor {
  enum Name {
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#2a0832"></span>
    /// Alpha: 100% <br/> (0x2a0832ff)
    case BackgroundDark
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fff7dd"></span>
    /// Alpha: 100% <br/> (0xfff7ddff)
    case BackgroundLight
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#673f31"></span>
    /// Alpha: 100% <br/> (0x673f31ff)
    case TileOutlineDark
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fce7ab"></span>
    /// Alpha: 100% <br/> (0xfce7abff)
    case TileOutlineLight
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#1eb7da"></span>
    /// Alpha: 100% <br/> (0x1eb7daff)
    case TileTouchBlue
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#becf6e"></span>
    /// Alpha: 100% <br/> (0xbecf6eff)
    case TileTouchGreen
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e1189d"></span>
    /// Alpha: 100% <br/> (0xe1189dff)
    case TileTouchHotPink
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fc5e8a"></span>
    /// Alpha: 100% <br/> (0xfc5e8aff)
    case TileTouchLightPink
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d58ea3"></span>
    /// Alpha: 100% <br/> (0xd58ea3ff)
    case TileTouchMauve
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f3b040"></span>
    /// Alpha: 100% <br/> (0xf3b040ff)
    case TileTouchMustard
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#c074fc"></span>
    /// Alpha: 100% <br/> (0xc074fcff)
    case TileTouchPurple
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fc4a37"></span>
    /// Alpha: 100% <br/> (0xfc4a37ff)
    case TileTouchRed
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fd775a"></span>
    /// Alpha: 100% <br/> (0xfd775aff)
    case TileTouchSalmon
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fd775a"></span>
    /// Alpha: 100% <br/> (0xfd775aff)
    case TileTouchTeal
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fec92e"></span>
    /// Alpha: 100% <br/> (0xfec92eff)
    case TileTouchYellow

    var rgbaValue: UInt32! {
      switch self {
      case .BackgroundDark: return 0x2a0832ff
      case .BackgroundLight: return 0xfff7ddff
      case .TileOutlineDark: return 0x673f31ff
      case .TileOutlineLight: return 0xfce7abff
      case .TileTouchBlue: return 0x1eb7daff
      case .TileTouchGreen: return 0xbecf6eff
      case .TileTouchHotPink: return 0xe1189dff
      case .TileTouchLightPink: return 0xfc5e8aff
      case .TileTouchMauve: return 0xd58ea3ff
      case .TileTouchMustard: return 0xf3b040ff
      case .TileTouchPurple: return 0xc074fcff
      case .TileTouchRed: return 0xfc4a37ff
      case .TileTouchSalmon: return 0xfd775aff
      case .TileTouchTeal: return 0xfd775aff
      case .TileTouchYellow: return 0xfec92eff
      }
    }
  }

  convenience init(named name: Name) {
    self.init(rgbaValue: name.rgbaValue)
  }
}

