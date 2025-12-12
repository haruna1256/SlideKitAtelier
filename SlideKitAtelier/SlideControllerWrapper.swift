//
//  SlideControllerWrapper.swift
//  SlideKitAtelier
//
//  Created by 川岸遥奈 on 2025/12/12.
//

import SwiftUI
import SlideKit
import Combine

/// SlideIndexControllerをラップして、すべてのナビゲーション操作を追跡するクラス
@MainActor
class SlideControllerWrapper: ObservableObject {
    let controller: SlideIndexController

    /// 内部的なステップカウンター（ページとフェーズを含む全体の進行度）
    @Published private(set) var absoluteStep: Int = 0

    /// リモート同期中かどうか（無限ループ防止用）
    private(set) var isSyncing: Bool = false

    private var cancellables = Set<AnyCancellable>()

    init(controller: SlideIndexController) {
        self.controller = controller

        // currentIndexの変更を監視して、大きな変化（ページ変更）を検出
        controller.$currentIndex
            .removeDuplicates()
            .sink { [weak self] _ in
                // ページが変わった場合、絶対ステップを再計算
                self?.recalculateAbsoluteStep()
            }
            .store(in: &cancellables)
    }

    func forward() {
        controller.forward()
        absoluteStep += 1
    }

    func back() {
        guard absoluteStep > 0 else { return }
        controller.back()
        absoluteStep -= 1
    }

    /// 受信した絶対ステップに同期
    func syncTo(absoluteStep targetStep: Int) {
        // 既に同じステップにいる場合は何もしない
        guard self.absoluteStep != targetStep else {
            return
        }


        // 同期中フラグを立てる
        isSyncing = true
        defer { isSyncing = false }

        let difference = targetStep - absoluteStep

        if difference > 0 {
            for _ in 0..<difference {
                controller.forward()
            }
        } else if difference < 0 {
            for _ in 0..<abs(difference) {
                controller.back()
            }
        }

        absoluteStep = targetStep
    }

    private func recalculateAbsoluteStep() {
        // ページ変更時の処理（必要に応じて実装）
        // 現時点では forward/back を通じた変更のみを追跡
    }
}
