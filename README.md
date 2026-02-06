# SlideKitAtelier
## WEB・モバイルゼミ 

SwiftUI と SlideKit を用いた **インタラクティブなプレゼン資料の設計** を研究テーマとしています。  
日常的なプレゼン作成の効率化や、視覚的にわかりやすい資料作りを目指した実験的アプリです。

---

## 研究背景

- 従来のプレゼン作成ツールは操作が固定的で、デザインや動的演出に制約が多い  
- スライドを **コードで自由に設計** できる環境があれば、より創造的で柔軟な資料作りが可能  

---

## 目的

- SwiftUI と SlideKit を活用し、**視覚的にわかりやすく、動的なスライド構成** を検証  
- 画像・テキスト・背景・グラデーションを組み合わせ、デザイン性と可読性の両立を目指す  
- PDF 出力や発表者用画面など、実用的な機能も検証  

---

## 手法

1. **スライド構成**  
   - `SlideConfiguration` で全体のサイズや順序を管理  
   - `SlideRouterView` でスライド遷移を制御

2. **デザイン**  
   - グラデーション背景や画像のレイアウトをコードで定義  
   - タイトルスライドでは、画像横にタイトルを下寄せ配置  

3. **フォント**  
   - `"kiwi Maru Gothic ProN"` を採用  
   - 読みやすさとプレゼン向きのデザインを意識  

4. **成果確認**  
   - Preview でスライドの表示確認  
   - PDF 書き出しで資料として保存可能  
   - 発表者用画面でスライド進行管理

5. **他端末との同期**
   - macとスマホの同期

---

## 実装
#### タイトル
<img width="400" height="250" alt="image" src="https://github.com/user-attachments/assets/e94e312a-e6f4-41ac-afce-b5cf60bc986d" />

#### 目次
<img width="400" height="250" alt="image" src="https://github.com/user-attachments/assets/4b675d62-4236-4357-82ec-0faed603e4e6" />

#### 各タイトル
<img width="400" height="250" alt="image" src="https://github.com/user-attachments/assets/c9e64741-5d06-4dca-8dd6-bae58df6abdc" />

#### 概要
<img width="400" height="250" alt="image" src="https://github.com/user-attachments/assets/e04d45ac-13dd-403a-af27-4813daeaa751" />
<img width="400" height="250" alt="image" src="https://github.com/user-attachments/assets/7f8565cc-7c92-428c-9c93-1e6ba6cd3598" />
<img width="400" height="250" alt="image" src="https://github.com/user-attachments/assets/850f5e11-14d8-4858-b835-23cdca0e66b5" />
<img width="400" height="250" alt="image" src="https://github.com/user-attachments/assets/0f6573e5-0441-4883-ae3b-786513fe64e7" />

### 結果
* Swift on Windows では、可能性検証を目的として環境構築からビルドまでを実施した。
  * 公式ドキュメントやツールチェーンを調査し、macOS 以外での Swift の位置づけを理解した。
    * 結果として、実用には制約がある一方で、Swift の移植性を確認する経験となった。
* 実際のスライド開発は macOS + Xcode を中心に行った。
  * SwiftUI と SlideKit を用い、UI設計・状態管理・アニメーションを含めた構築を行った。
  * 実務に近い環境で試行錯誤することで、設計と実装を往復する経験を積んだ。
* SlideKit の Phase 機構を活用し、情報を段階的に提示する構成を設計した。
  * 単なる表示制御ではなく、「どの順番で伝えるか」を意識してスライドを構築した。
  * プレゼンそのものを UI として捉える視点を得ることができた。
* iOS と連携し、iPhone からスライドの表示切替や進行操作を行える仕組みを実装した。
  * 操作する側の UX を考慮し、直感的に扱える UI を意識して設計した。
  * デバイス間連携を通して、状態共有や入力設計への理解が深まった。
* 本制作を通して、スライド作成を単なる資料作りではなく開発体験として捉えられた。
  * UI設計・状態管理・拡張性を意識した構成を考える力が身についた。
  * 好きな技術を使いながら、設計力を伸ばせることを実感した。

### 今後の課題


### 参考文献
https://www.swift.org/
https://mtj0928.github.io/SlideKit/documentation/slidekit/







