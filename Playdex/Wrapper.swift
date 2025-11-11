//
//  Wrapper.swift
//  Playdex
//
//  Created by Bastien Soucasse on 11/11/25.
//

import IGDB_SWIFT_API

let wrapper = IGDBWrapper(proxyURL: "http://localhost:8080", proxyHeaders: ["Content-Type": "text/plain"])

private let imageBaseURL = "https://images.igdb.com/igdb/image/upload"

enum ArtworkType: String {
    case artwork = "1"
    case keyArtWithoutLogo = "2"
    case keyArtWithLogo = "3"
    case conceptArt = "4"
    case gameLogoWhite = "5"
    case gameLogoBlack = "6"
    case gameLogoColor = "7"
    case infographic = "8"
}

enum ImageSize: String {
    case MICRO = "t_micro"  // 35 x 35, thumb, center gravity
    case THUMB = "t_thumb"  // 90 x 90, thumb, center gravity
    case COVER_SMALL = "t_cover_small"  // 90 x 128, fit
    case COVER_BIG = "t_cover_big"  // 264 x 374, fit
    case LOGO_MEDIUM = "t_logo_med"  // 284 x 160, fit
    case SCREENSHOT_MEDIUM = "t_screenshot_med"  // 569 x 320, lfill, center gravity
    case SCREENSHOT_BIG = "t_screenshot_big"  // 889 x 500, lfill, center gravity
    case SCREENSHOT_HUGE = "t_screenshot_huge"  // 1280 x 720, lfill, center gravity
    case HD = "t_720p"  // 1280 x 720, fit, center gravity
    case FHD = "t_1080p"  // 1920 x 1080, fit, center gravity
    case ORIGINAL = "t_original"
}

enum ImageType: String {
    case JPEG = "jpg"
    case PNG = "png"
    case GIF = "gif"
    case WEBP = "webp"
}

func getImageURL(
    _ imageID: String,
    retina: Bool = true,
    size: ImageSize = .ORIGINAL,
    type: ImageType = .PNG,
) -> String {
    let suffix = retina && size != .ORIGINAL ? "_2x" : ""
    return "\(imageBaseURL)/\(size.rawValue)\(suffix)/\(imageID).\(type.rawValue)"
}

let imageBuilder = getImageURL
