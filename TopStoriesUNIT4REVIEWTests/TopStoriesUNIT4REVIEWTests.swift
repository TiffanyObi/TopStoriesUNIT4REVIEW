//
//  TopStoriesUNIT4REVIEWTests.swift
//  TopStoriesUNIT4REVIEWTests
//
//  Created by Tiffany Obi on 2/6/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import XCTest
@testable import TopStoriesUNIT4REVIEW

class TopStoriesUNIT4REVIEWTests: XCTestCase {

    
    
    func checkApiForModel() {
        
        struct SearchResult: Codable {
                
                let results: [Details]
                
            }
            struct Details: Codable {
               
            }
        
        struct Books: Codable {
            let title: String
        }

    
   let json = """
{
    "status": "OK",
    "results": [{
            "section": "us",
            "subsection": "politics",
            "title": "Trump Administration Freezes Global Entry Enrollment in New York Over Immigration Law",
            "abstract": "The move escalates a clash between the administration and the state over a law that allows undocumented immigrants to obtain driver’s licenses.",
            "url": "https://www.nytimes.com/2020/02/06/us/politics/dhs-new-york-global-entry.html",
            "uri": "nyt://article/23fb8409-46f1-5f0f-b663-afc9f8eaf0bb",
            "byline": "By Zolan Kanno-Youngs and Jesse McKinley",
            "item_type": "Article",
            "updated_date": "2020-02-06T08:56:55-05:00",
            "created_date": "2020-02-06T00:12:30-05:00",
            "published_date": "2020-02-06T00:12:30-05:00",
            "material_type_facet": "",
            "kicker": "",
            "des_facet": [
                "Immigration and Emigration",
                "Illegal Immigration"
            ],
            "org_facet": [
                "Homeland Security Department"
            ],
            "per_facet": [
                "Cuomo, Andrew M",
                "Trump, Donald J"
            ],
            "geo_facet": [
                "New York State"
            ],
            "multimedia": [{
                    "url": "https://static01.nyt.com/images/2020/02/05/briefing/05dc-DHS-entry/merlin_53911875_652526bb-a36e-461d-8d79-33d961b39c6e-superJumbo.jpg",
                    "format": "superJumbo",
                    "height": 1365,
                    "width": 2048,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Enrollment in Global Entry and several other expedited-travel programs has been suspended for all residents of New York State in a bid to force local authorities to submit to directives by the Department of Homeland Security.",
                    "copyright": "Marilynn K. Yee/The New York Times"
                },
                {
                    "url": "https://static01.nyt.com/images/2020/02/05/briefing/05dc-DHS-entry/05dc-DHS-entry-thumbStandard.jpg",
                    "format": "Standard Thumbnail",
                    "height": 75,
                    "width": 75,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Enrollment in Global Entry and several other expedited-travel programs has been suspended for all residents of New York State in a bid to force local authorities to submit to directives by the Department of Homeland Security.",
                    "copyright": "Marilynn K. Yee/The New York Times"
                },
                {
                    "url": "https://static01.nyt.com/images/2020/02/05/briefing/05dc-DHS-entry/05dc-DHS-entry-thumbLarge.jpg",
                    "format": "thumbLarge",
                    "height": 150,
                    "width": 150,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Enrollment in Global Entry and several other expedited-travel programs has been suspended for all residents of New York State in a bid to force local authorities to submit to directives by the Department of Homeland Security.",
                    "copyright": "Marilynn K. Yee/The New York Times"
                },
                {
                    "url": "https://static01.nyt.com/images/2020/02/05/briefing/05dc-DHS-entry/merlin_53911875_652526bb-a36e-461d-8d79-33d961b39c6e-mediumThreeByTwo210.jpg",
                    "format": "mediumThreeByTwo210",
                    "height": 140,
                    "width": 210,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Enrollment in Global Entry and several other expedited-travel programs has been suspended for all residents of New York State in a bid to force local authorities to submit to directives by the Department of Homeland Security.",
                    "copyright": "Marilynn K. Yee/The New York Times"
                },
                {
                    "url": "https://static01.nyt.com/images/2020/02/05/briefing/05dc-DHS-entry/merlin_53911875_652526bb-a36e-461d-8d79-33d961b39c6e-articleInline.jpg",
                    "format": "Normal",
                    "height": 127,
                    "width": 190,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Enrollment in Global Entry and several other expedited-travel programs has been suspended for all residents of New York State in a bid to force local authorities to submit to directives by the Department of Homeland Security.",
                    "copyright": "Marilynn K. Yee/The New York Times"
                }
            ],
            "short_url": "https://nyti.ms/371T1wX"
        },
        {
            "section": "nyregion",
            "subsection": "",
            "title": "Can a Lame Duck Mayor Get New Yorkers to Believe in Him Again?",
            "abstract": "Bill de Blasio wants to tackle homelessness and the property tax system in his final two years in office. But his clout is in question.",
            "url": "https://www.nytimes.com/2020/02/06/nyregion/bill-de-blasio-mayor-nyc.html",
            "uri": "nyt://article/3261f2af-6e18-5714-bcec-34fa580c120a",
            "byline": "By Emma G. Fitzsimmons",
            "item_type": "Article",
            "updated_date": "2020-02-06T09:19:31-05:00",
            "created_date": "2020-02-06T03:00:08-05:00",
            "published_date": "2020-02-06T03:00:08-05:00",
            "material_type_facet": "",
            "kicker": "",
            "des_facet": [
                "Politics and Government",
                "Mayors",
                "State of the City Message (NYC)"
            ],
            "org_facet": [],
            "per_facet": [
                "de Blasio, Bill"
            ],
            "geo_facet": [
                "New York City"
            ],
            "multimedia": [{
                    "url": "https://static01.nyt.com/images/2020/02/06/nyregion/06deblasio-1/merlin_168178377_646784e6-1c42-490d-ac30-299d7a0519e6-superJumbo.jpg",
                    "format": "superJumbo",
                    "height": 1365,
                    "width": 2048,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Mayor Bill de Blasio, at a recent staff meeting at City Hall, said that reducing the city’s homeless population is one of his top remaining priorities.",
                    "copyright": "Brittainy Newman/The New York Times"
                },
                {
                    "url": "https://static01.nyt.com/images/2020/02/06/nyregion/06deblasio-1/06deblasio-1-thumbStandard.jpg",
                    "format": "Standard Thumbnail",
                    "height": 75,
                    "width": 75,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Mayor Bill de Blasio, at a recent staff meeting at City Hall, said that reducing the city’s homeless population is one of his top remaining priorities.",
                    "copyright": "Brittainy Newman/The New York Times"
                },
                {
                    "url": "https://static01.nyt.com/images/2020/02/06/nyregion/06deblasio-1/06deblasio-1-thumbLarge.jpg",
                    "format": "thumbLarge",
                    "height": 150,
                    "width": 150,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Mayor Bill de Blasio, at a recent staff meeting at City Hall, said that reducing the city’s homeless population is one of his top remaining priorities.",
                    "copyright": "Brittainy Newman/The New York Times"
                },
                {
                    "url": "https://static01.nyt.com/images/2020/02/06/nyregion/06deblasio-1/06deblasio-1-mediumThreeByTwo210-v2.jpg",
                    "format": "mediumThreeByTwo210",
                    "height": 140,
                    "width": 210,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Mayor Bill de Blasio, at a recent staff meeting at City Hall, said that reducing the city’s homeless population is one of his top remaining priorities.",
                    "copyright": "Brittainy Newman/The New York Times"
                },
                {
                    "url": "https://static01.nyt.com/images/2020/02/06/nyregion/06deblasio-1/merlin_168178377_646784e6-1c42-490d-ac30-299d7a0519e6-articleInline.jpg",
                    "format": "Normal",
                    "height": 127,
                    "width": 190,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Mayor Bill de Blasio, at a recent staff meeting at City Hall, said that reducing the city’s homeless population is one of his top remaining priorities.",
                    "copyright": "Brittainy Newman/The New York Times"
                }
            ],
            "short_url": "https://nyti.ms/2OMiNiL"
        }
    ]


}
"""

}
    
}
