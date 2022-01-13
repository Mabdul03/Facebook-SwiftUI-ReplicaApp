/*  Author: Meer Abdullah
 *  Date: 6/8/21.
 *  Synopsis: ViewControllerPractice
 *  Facebook App Replica (in terms of the UI atleast)
 *  This swift file deals with button management, and
 *  deals with how the posts are formatted on the UI
 *  (i.e., color of the persons name, their picture, what
 *  they say in the post, likes/comment/shares buttons, etc) */

import Foundation
import SwiftUI

struct FBPost: View{
    
    @State var isliked: Bool = false
    let model: FBPostModel
    
    var body: some View{
        VStack{
            HStack{
                // model.imagename is Person1 for all, so receives
                // Person1 from assets and puts the picture on the UI.
                Image(model.imageName)
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(25)
                VStack{
                    HStack{
                        // The background name color is blue.
                        Text(model.name)
                            .foregroundColor(Color.blue)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                        Spacer()
                    }
                    HStack{
                        // Displays how long abgo the post was created, or posted.
                        Text("5 minutes ago")
                            .foregroundColor(Color(.secondaryLabel))
                        Spacer()
                    }
                }
            }
            // Spacer used to make the image look the same on any generation of iPhone.
            Spacer()
            HStack{
                Text(model.post)
                    .font(.system(size: 24, weight: .regular, design: .default))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
            Spacer()
            
            // Dealt with buttons on the horizontal stack; If you like a post, it turns to "liked"
            HStack{
                Button(action:{
                    isliked.toggle()
                }, label:{
                    Text(isliked ? "Liked": "Like")
                })
                
                Spacer()
                // No action done for comment... for now.
                Button(action:{
                    
                }, label:{
                    Text("Comment")
                })
                
                Spacer()
                // No action done for share... for now.
                Button(action:{
                    
                }, label:{
                    Text("Share")
                })
            }.padding()
        }.padding()
        .background(Color(.systemBackground))
        .cornerRadius(7)
    }
}
