//
//  HorizontalSnappingController.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-26.
//

import UIKit


class HorizontalSnappingController: UICollectionViewFlowLayout {
    
//    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
//
//        guard let collectionView = self.collectionView else {
//            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
//        }
//
//        let itemWidth = collectionView.frame.width - 48 // This 48 comes from AppsHorizontalController's `sizeForItemAt`
//
//        let pageNumber = collectionView.contentOffset.x / itemWidth
//
//        print(pageNumber)
//
//        return CGPoint(x: pageNumber * itemWidth, y: 0)
//    }
    
    // https://stackoverflow.com/a/50155920
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
        let parent = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)

        let itemWidth = collectionView.frame.width - 48 // This 48 comes from AppsHorizontalController's `sizeForItemAt`
        let itemSpace = itemWidth + minimumInteritemSpacing
        var pageNumber = round(collectionView.contentOffset.x / itemSpace)

        // Skip to the next cell, if there is residual scrolling velocity left.
        // This helps to prevent glitches
        let vX = velocity.x
        if vX > 0 {
          pageNumber += 1
        } else if vX < 0 {
          pageNumber -= 1
        }

        let nearestPageOffset = pageNumber * itemSpace
        return CGPoint(x: nearestPageOffset,
                       y: parent.y)
      }
}
