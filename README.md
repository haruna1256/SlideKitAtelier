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









