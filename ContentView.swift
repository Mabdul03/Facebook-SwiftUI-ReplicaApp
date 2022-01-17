/** 
 *  Author: Meer Abdullah
 *  Date: 6/8/21.
 *  Synopsis: ViewControllerPractice
 *  Facebook App Replica (in terms of the UI atleast)
 *  This swift files deals with the actual information
 *  that is going to be on the posts themselves.
 *  There is also more info added... such as images to
 *  replicate the facebook UI, and additional features like
 *  horizontal scrolling (stories), and vertical scrolling (posts) 
 */

import SwiftUI

// struct to define what information is within a facebook post
struct FBPostModel: Hashable{
    let name: String
    let post: String
    let imageName: String
}

struct ContentView: View {
    @Binding var text: String
    let stories = ["Story1", "Story2", "Story3", "Story1", "Story2", "Story3"]
    
    // array of FBPostmodel structs - fields already initialized
    let posts = [FBPostModel(name: "Bill Nye The Science Guy",
                             post: "I taught all physic ideologies !",
                             imageName: "Person1"),
                 FBPostModel(name: "Bill Nye The Science Guy",
                             post: "Going to the moon would be fun... wouldn't it ?",
                             imageName: "Person1"),
                 FBPostModel(name: "Bill Nye The Science Guy",
                             post: "I'm just a legend... like bro... who doesn't know who I am?",
                             imageName: "Person1")]
    
    // played around until I got a blue that resembles facebook
    let facebookBlue = UIColor(red: 23/255.0,
                               green: 120/255.0,
                               blue: 242/255.0,
                               alpha: 1)
    var body: some View {
        VStack{
            HStack{
                // Adds facebook text on horizontal stack
                Text("facebook")
                    .font(.system(size: 48, weight: .bold, design: .default))
                    .foregroundColor(Color(facebookBlue))
                // Spacer to even out space between the "facebook" text and the image
                Spacer()
                // Played around with frame arguments - did what I felt looked good.
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(Color(.secondaryLabel))
            }.padding()
            /* Functionality of a search bar - you can type within it
             * Note: A database/backend is not tied to the search bar,
             * so there is nothing to search up... for now. */
            TextField("Search...", text: $text)
                .padding(7)
                .background(Color(.systemGray5))
                .padding(.horizontal,15)
                .cornerRadius(7)
            
            ZStack{
                Color(.secondarySystemBackground)
                // Provides functionality of being able to scroll upwards
                ScrollView(.vertical){
                    VStack{
                        /* displays the stories from the assets */
                        StoriesView(stories: stories)
                        /* For each loop - adds a spaces for each Facebook Post */
                        ForEach(posts, id: \.self){ model in
                            FBPost(model: model)
                            Spacer()
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: .constant(""))
    }
}
