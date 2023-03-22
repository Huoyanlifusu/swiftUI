//第一种 大方框内嵌套多个小方框的选择框设计
Rectangle()
.fill(Color(uiColor: UIColor.lightGray))
.frame(maxWidth: .infinity)
.frame(height: 40)
.cornerRadius(15)
.overlay(
    HStack {
        RoundedRectangle(cornerRadius: 15)
            .fill((voxelSize == VoxelSize.twomm) ? Color.white : Color(uiColor: UIColor.lightGray))
            .frame(maxWidth: 88)
            .frame(height: 36)
            .overlay {
                Text("2mm")
                    .onTapGesture {
                        voxelSize = VoxelSize.twomm
                    }
                    .padding(5)
            }
        Divider()
            .background(Color.white)
        RoundedRectangle(cornerRadius: 15)
            .fill((voxelSize == VoxelSize.fivemm) ? Color.white : Color(uiColor: UIColor.lightGray))
            .frame(maxWidth: 88)
            .frame(height: 36)
            .overlay {
                Text("5mm")
                    .onTapGesture {
                        voxelSize = VoxelSize.fivemm
                    }
                    .padding(5)
            }
        Divider()
            .background(Color.white)
        RoundedRectangle(cornerRadius: 15)
            .fill((voxelSize == VoxelSize.tenmm) ? Color.white : Color(uiColor: UIColor.lightGray))
            .frame(maxWidth: 88)
            .frame(height: 36)
            .overlay {
                Text("10mm")
                    .onTapGesture {
                        voxelSize = VoxelSize.tenmm
                    }
                    .padding(5)
            }
    }
)
.mask(
    RoundedRectangle(cornerRadius: 15)
        .frame(width: 300, height: 40)
)



//第二种 显示内存占用率的长条UI
VStack(spacing: 0) {
    HStack {
        // https://stackoverflow.com/questions/56465083/custom-font-size-for-text-in-swiftui
        Text("Used Memory:")
        Spacer()
        Text("\(UIDevice.current.usedDiskSpaceInGB)" + " / " + "\(UIDevice.current.totalDiskSpaceInGB)")
            .font(.system(size: 14)).foregroundColor(Color(UIColor.lightGray))
    }
    Spacer().frame(height: 10)
    GeometryReader { geometry in
        // https://stackoverflow.com/questions/64031680/remove-padding-bewteen-items-in-hstack
        HStack(spacing: 0) {
            Rectangle()
                .foregroundColor(Color.orange)
                .frame(width: convertBytesToOccupationRate(usedMemory, totalMemory) * geometry.size.width,
                       height: geometry.size.height)
            Rectangle()
                .foregroundColor(Color.cyan)
                .frame(width: convertBytesToOccupationRate(freeMemory, totalMemory) * geometry.size.width,
                       height: geometry.size.height)
        }.mask(
            RoundedRectangle(cornerRadius: 15)
        )
    }
}


//第三种 按钮内嵌套文本和图片 例如一些app的登录/注册按钮
Button(action: {
    loginWithWechat()
}) {
    HStack {
        //https://stackoverflow.com/questions/56505692/how-to-resize-image-with-swiftui resize image
        Image("wechat").resizable().frame(width: 22.9, height: 20)
        Text("Login With Wechat").bold()
    }
}
.foregroundColor(.white)
.padding()
.background(Color.black)
.cornerRadius(.infinity)
.overlay(content: {
    RoundedRectangle(cornerRadius: .infinity).stroke(Color.white, lineWidth: 1)
})
.frame(width: 300, height: 50)



