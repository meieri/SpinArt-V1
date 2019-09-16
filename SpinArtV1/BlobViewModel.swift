//
//  BlobViewModel.swift
//  SpinArtV1
//
//  Created by Isaak Meier on 9/16/19.
//  Copyright © 2019 Isaak Meier. All rights reserved.
//

import Foundation
import UIKit

class BlobViewModel {

    var blobs = [Blob]()

    func getBlobs() -> [Blob] {
        let copy = blobs
        return copy
    }

    func addBlob(blob: Blob) {
        blobs.append(blob)
    }

    func stepBlobs() {
        var newBlobs = [Blob]()
        for blob in blobs {
            let newInkAmount = blob.inkAmount - blob.inkAmount / 10
            let newRadius = blob.radius - blob.radius / 10
            let newPosition = CGPoint(x: blob.position.x + blob.position.x / 2,
                                      y: blob.position.y + blob.position.y / 2)
            let newBlob = Blob(inkAmount: newInkAmount, postion: newPosition, radius: newRadius)
            newBlobs.append(newBlob)
        }
        blobs = newBlobs
    }
}
