//
// Automat
//
// Copyright (c) 2019 Automat Berlin GmbH - https://automat.berlin/
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

class Settings {
    var codecs = [Codec]()
    var srtpOptions: SRTP?
    var appIcon: Int = 0

    private enum Keys: String {
        case codecs
        case srtpOptions
        case appIcon
    }

    func save() {
        UserDefaults.standard.setStructArray(codecs, forKey: Keys.codecs.rawValue)
        UserDefaults.standard.setStruct(srtpOptions, forKey: Keys.srtpOptions.rawValue)
        UserDefaults.standard.set(appIcon, forKey: Keys.appIcon.rawValue)
    }

    func load() {
        codecs = UserDefaults.standard.structArrayData(Codec.self, forKey: Keys.codecs.rawValue)
        srtpOptions = UserDefaults.standard.structData(SRTP.self, forKey: Keys.srtpOptions.rawValue)
        appIcon = UserDefaults.standard.integer(forKey: Keys.appIcon.rawValue)
    }

    func clear() {
        UserDefaults.standard.removeObject(forKey: Keys.codecs.rawValue)
        UserDefaults.standard.removeObject(forKey: Keys.srtpOptions.rawValue)
        UserDefaults.standard.set(0, forKey: Keys.appIcon.rawValue)
    }
}
