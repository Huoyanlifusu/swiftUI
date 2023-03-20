//
//  SettingSUIV.swift
//  ScanKit
//
//  Created by 张裕阳 on 2023/3/17.
//

import Foundation
import SwiftUI


struct SettingSUIV: View {
    @State private var selectedAlgorithm: Algorithm = .lidar
    @State private var voxelSize: VoxelSize = .twomm
    
    @State private var saveData = true
    
    @State private var isPresentingAbout = false
    @State private var isPresentingPrivacy = false
    
    @State private var HStackBackgroundColor = Color.white
    
    enum Algorithm: String, CaseIterable, Identifiable {
        case ML, lidar
        var id: Self { self }
    }
    
    enum VoxelSize: CaseIterable, Identifiable {
        case twomm, fivemm, tenmm
        var id: Self { self }
    }
    
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Mesh")) {
                    VStack {
                        HStack {
                            Text("Voxel Size")
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
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
                    }
                    Picker("Algorithm", selection: $selectedAlgorithm) {
                        Text("Machine Learning").tag(Algorithm.ML).frame(maxWidth: .infinity)
                        Text("Lidar Sensor").tag(Algorithm.lidar).frame(maxWidth: .infinity)
                    }
                }
                
                Section(header: Text("Data Management")) {
                    Toggle(isOn: $saveData, label: {
                        Text("Saving Data")
                    })
                    Button("Clear Data") {
                        clearData()
                    }.foregroundColor(Color.red)
                }
                
                Section(header: Text("Product")) {
                    NavigationLink(destination: AboutSUIV()) {
                        Text("About").foregroundColor(Color.blue)
                    }
                    NavigationLink(destination: PrivacySUIV()) {
                        Text("Privacy policy").foregroundColor(Color.blue)
                    }
                    Button("Sending Feedback") {
                        openMailBox()
                    }.foregroundColor(Color.blue)
                }
                
                Section(header: Text("Versee")) {
                    HStack {
                        Text("Follow on Bilibili")
                        Spacer()
                        Image("bilibili")
                            .resizable()
                            .frame(maxWidth: 25, maxHeight: 25)
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        jumpToBilibili()
                    }
                    HStack {
                        Text("Follow on Twitter")
                        Spacer()
                        Image("Twitter")
                            .resizable()
                            .frame(maxWidth: 20, maxHeight: 20)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 25)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        jumpToTwitter()
                    }
                }
            }
        }
    }
}

extension SettingSUIV {
    func clearData() {
        print("已经删除所有数据！")
    }
    
    func openMailBox() {
        if let url = URL(string: "message://") {
            UIApplication.shared.open(url)
        }
    }
    
    func jumpToBilibili() {
        if let url = URL(string: "https://space.bilibili.com/1946896308") {
            UIApplication.shared.open(url)
        }
    }

    func jumpToTwitter() {
        if let url = URL(string: "https://twitter.com/TechVersee") {
            UIApplication.shared.open(url)
        }
    }
}
