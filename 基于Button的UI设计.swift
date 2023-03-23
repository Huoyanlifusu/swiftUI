//圆环形按钮
Button(action: {
    isPresentingScan.toggle()
    newCapture()
}) {
    Image(systemName: "plus").font(.system(size: 24)).foregroundColor(.white)
}.frame(width: 36, height: 36)
.background(Color.black)
.clipShape(Circle())
.padding(8)
.overlay(
    Circle().stroke(Color.black, lineWidth: 1).shadow(radius: 3)
)
.overlay(
    GeometryReader { geo in
        Color.clear.preference(key: ButtonOffsetKey.self, value: geo.frame(in: .global).minY)
    }
).fullScreenCover(isPresented: $isPresentingScan) {
    ScanVC_representable().ignoresSafeArea(.all)
}
