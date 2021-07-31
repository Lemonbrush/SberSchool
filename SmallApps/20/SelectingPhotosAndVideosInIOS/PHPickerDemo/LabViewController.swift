//
//  LabViewController.swift
//  PHPickerDemo
//
//  Created by Leonid Serebryanyy on 30.07.2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import UIKit

class LabViewController: UIViewController {
	
	private lazy var imageView: UIImageView = {
		let v = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
//		v.translatesAutoresizingMaskIntoConstraints = false
		v.contentMode = .scaleAspectFit
		return v
	}()
	
	func drawImage() {
		let renderer = UIGraphicsImageRenderer(size: CGSize(width: 200, height: 200))
		let image = renderer.image { (context) in
			UIColor.darkGray.setStroke()
			context.stroke(renderer.format.bounds)
			
			UIColor.randomColor.setFill()
			context.fill(CGRect(x: 1, y: 1, width: 140, height: 140))
			
			UIColor.randomColor.setFill()
			context.fill(CGRect(x: 60, y: 60, width: 140, height: 140), blendMode: .normal)
		}
		imageView.image = image
	}
	
	func drawImageCG() {
		let renderer = UIGraphicsImageRenderer(size: CGSize(width: 200, height: 200))
		
		let image = renderer.image { (context) in
			UIColor.darkGray.setStroke()
			context.stroke(renderer.format.bounds)
			
			UIColor.randomColor.setFill()
			context.fill(CGRect(x: 1, y: 1, width: 140, height: 140))
			
			UIColor.randomColor.setFill()
			context.fill(CGRect(x: 60, y: 60, width: 140, height: 140), blendMode: .normal)
		}
		imageView.image = image
	}
	
	func drawYourBest() {
		let renderer = UIGraphicsImageRenderer(size: CGSize(width: 200, height: 200))
		let image = renderer.image { (context) in
			UIColor.darkGray.setStroke()
			context.stroke(renderer.format.bounds)
			
			UIColor.randomColor.setFill()
			context.fill(CGRect(x: 1, y: 1, width: 140, height: 140))
			
			UIColor.randomColor.setFill()
			context.fill(CGRect(x: 60, y: 60, width: 140, height: 140), blendMode: .multiply)
			
			UIColor.randomColor.setFill()
//			let path = UIBezierPath(roundedRect: CGRect(x: 70, y: 70, width: 140, height: 140), cornerRadius: 20)
			let path = UIBezierPath(roundedRect: CGRect(x: 70, y: 70, width: 140, height: 140), byRoundingCorners: [.bottomLeft], cornerRadii: CGSize(width: 30, height: 50))
			path.fill()
			
//			context.cgContext.fillEllipse(in: CGRect(x: 60, y: 60, width: 140, height: 140))
		}
		imageView.image = image
	}
	
	func rotate() {
		guard let inputImage = imageView.image else { return }
		let image = PHPickerDemo.rotate(inputImage: inputImage, angle: 90)
		imageView.image = image
	}
	
	override func viewDidLoad() {
		view.addSubview(imageView)
		imageView.center = self.view.center
	}
	
	override func viewDidAppear(_ animated: Bool) {
		drawYourBest()
//		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
//			self.rotate()
//		}
		
		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [self] in
			guard let inputImage = imageView.image else { return }
			let out = crop(
				inputImage: inputImage,
				to: CGRect(x: 0, y: 0, width: inputImage.size.width / 2,
						   height: inputImage.size.height / 2)
			)
			imageView.image = out
		}
	}
}

func rotate(inputImage: UIImage, angle: CGFloat) -> UIImage {
	let radians = CGFloat(angle * .pi) / 180.0 as CGFloat
	
	var newSize = CGRect(
		origin: CGPoint.zero,
		size: inputImage.size
	).applying(CGAffineTransform(rotationAngle: radians)).size
	
	// Trim off the extremely small float value to prevent core graphics from rounding it up
	newSize.width = floor(newSize.width)
	newSize.height = floor(newSize.height)
	let renderer = UIGraphicsImageRenderer(size: newSize)
	
	let image = renderer.image { rendederContext in
		let context = rendederContext.cgContext
		//rotate from center
		context.translateBy(x: newSize.width/2, y: newSize.height/2)
		context.rotate(by: radians)
		inputImage.draw(
			in: CGRect(
				origin: CGPoint(x: -inputImage.size.width/2,
								y: -inputImage.size.height/2),
				size: inputImage.size
			)
		)
	}
	
	return image
}

func crop(inputImage: UIImage, to cropRect: CGRect) -> UIImage? {
	let out = inputImage.cgImage!.cropping(to: cropRect)
	return UIImage(cgImage: out!)
}

extension UIImage {
	public func cropped(to cropRect: CGRect) -> UIImage? {
		let renderer = UIGraphicsImageRenderer(size: cropRect.size)
		return renderer.image { _ in
			self.draw(at: cropRect.origin)
		}
	}
}
