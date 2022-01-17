/** 
 * Author: Meer Abdullah
 *  Date: 6/8/21.
 *  Synopsis: ViewControllerPractice
 *  Facebook App Replica (in terms of the UI atleast)
 *  This swift file deals with the stories within the
 *  facebook application. Similar to other applications,
 *  you can scroll horizontally on the stories tab. Made
 *  this file such that it is well organized, and it is
 *  easier to track how I would want my stories tab to look
 *  The stories are assets (pictures), just to be a placeholder
 *  to display the functionality of StoriesView.
 *  (once again, there is no database/back end development tied to
 *  this app so far, used for developmental purposes for SwiftUI programming. 
 */

import Foundation
import SwiftUI
struct StoriesView: View{
    let stories: [String]
    var body: some View{
        //horizontal scroll on stories tab.
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 3){
                // for each loop to display each of the stories on the story panel
                ForEach(stories, id: \.self){ name in
                    /* Played around with how I wanted to the stories to look
                     * (i.e., the dimensions, color, how much I wanted it to fill, etc) */
                    Image(name)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 200, alignment: .center)
                        .background(Color.red)
                        .clipped()
                }
            }.padding()
        }
    }
}
