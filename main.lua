--これ（ハイフン二つとそれ以降の文）はコメントです。
--プログラム的に読み飛ばされ、メモなどを書いておきます。

--[[
これ（ハイフン二つと角カッコで囲われた部分）もコメントです。
複数行をコメントとして囲うことができます。
プログラムをコメント化することを「コメントアウトする。」と言います。
--]]

--[[
--次をif文と言います。
--例えば条件式として、(i == 1)とした場合は、変数iが１の時となります。
--また、(i > 1)では、iが１より大きい時となります。
if(条件式)then
	--条件にあった時に実行させる処理をここに記述します。
	--endでif文を閉じます。
end

-- ==（イコールふたつ）は、左辺と右辺が同一であるという意味です。
-- = （イコールひとつ）は、左辺に右辺に書かれたものを代入するという意味です。
--]]

--[[
--次をfor文と言います。
--例えば、i = 1, 10, 1 とした場合は、初期値として変数iが１の時となります。
--終了値の１０となるまで、iを１ずつ増やしている間は処理を繰り返します。
for 初期値,終了値,増分値 do
	--初期値が終了値になるまで実行させる処理をここに記述します。
	--endでfor文を閉じます。
end
--]]

--localは、このmain.luaファイル内でのみ有効とする意味を持ちます。
--アプリケーションが複雑になってきた場合には、複数のファイルに分けてプログラムを書きます。
--その際、同じような名前の変数を記述していてもエラーが起こらないように必ずつけるようにします。

--画面に表示させるものをオブジェクトと呼びます。
--画面に表示させずにアプリ内で利用する数値などを変数と呼びます。

----------------------------------------------------------------------------------------
--------ここから１限目--------
----------------------------------------------------------------------------------------

--------テキストの表示--------
--()内は、""内が表示するテキスト（日本語も可）,x座標,y座標,フォント,テキストのサイズ
local hello = display.newText("Hello,Corona！",160,20,native.systemFont, 44)

----------------------------------------------------------------------------------------

--------画像の表示--------
--()内は、""内が呼び出す画像ファイル,x座標,y座標
--local tree = display.newImage("green.png", 160, 300)

----------------------------------------------------------------------------------------

--[[
--------四角形の描画--------
--()内は、原点のx座標,原点のy座標,幅,高さ
local rect = display.newRect(100, 100,  100, 100 )

--------描いた四角形の色変更--------
--()内は、R（赤）,G（緑）,B（青）,アルファ（不透明度）。
--各数字は、0~1の間の数字とする。
rect:setFillColor( 1, 0.5, 0.1, 1 )

--------描いた四角形の不透明度変更--------
rect.alpha = 0.5
--]]

----------------------------------------------------------------------------------------

--[[
--------タッチで図形描画--------
--functionは、イベントが発生した時にひとかたまりの処理をさせることが出来ます。
--イベントとは、functionを発生させるトリガーとなるものです。
--onTouchは、このfunctionの名前です。他の名前をつけることも可能です。
--()内のeventは、タッチの状態を判定するのに利用します。解説は、後述します。
local function onTouch( event )
	--今回のfunctionでは、先ほどと違う位置に新たに四角形を描画します。
	local rect = display.newRect(200, 200,  100, 100 )
	--endでfunctionを閉じます。
end

--addEventListenerでfunctionの呼び出しを作成します。
--ここではアプリ全体をイベントリスナーの対象とするため、Runtimeを指定しています。
--()内は、""がイベントの種類で、タッチイベントを対象として指定し、onTouchがイベント発生時に呼び出すfunctionを指定しています。
Runtime:addEventListener( "touch", onTouch )
--※functionの呼び出しは、必ずfunctionが先に（上に）記述されていることが必要で名前も間違っているとエラーとなります。
--]]

----------------------------------------------------------------------------------------

--[[
--※タッチで図形描画はコメントアウトしておきましょう。
--------オブジェクトのドラッグ--------
--四角形の描画（先ほどのものをコピペし、新たに記述しなくても構いません。）
local rect = display.newRect(100, 100,  100, 100 )

--moveRectというfunctionを作成
local function moveRect( event )
	--イベントの状態がmovedと同じ状態、すなわちドラッグ中である場合に実行する
	if( event.phase == "moved" ) then
		--四角形のx座標にイベントのx座標を代入
		rect.x = event.x
		--四角形のy座標にイベントのy座標を代入
		rect.y = event.y
		--endでif文を閉じます。
	end
	--endでfunctionを閉じます。
end

--四角形をタッチイベントのリスナーに指定し、イベント発生時にmoveRectを呼び出しています。
rect:addEventListener( "touch", moveRect )
--]]

----------------------------------------------------------------------------------------

--[[
--※オブジェクトのドラッグはコメントアウトしておきましょう。
--------BGMの再生--------
--BGMを準備します。""内が呼び出す音声ファイル
local BGM = audio.loadSound( "bgm.mp3")

--音の再生をします。()内は、再生する対象, {}内に付随する設定
--loopsは繰り返し回数で、-1とするとずっと繰り返し、例えば3であれば３回で再生が終わります。
audio.play( BGM,{ loops = -1 } )
-- { } の中に書くことが出来るものには他にも以下のようなものがあります。
--再生を遅延させる。プログラムではミリ秒という単位なので、1000は１秒となります。
--duration = 1000,
--フェードインで再生させる。3000とすると３秒かけてフェードイン（徐々に音量が増）します。
--fadein = 3000,
--onCompleteでは、再生終了後にfunctionを発生させたいときに利用します。=以降に呼び出すfunction名を記述します。
--onComplete = callbackListener
--]]

----------------------------------------------------------------------------------------

--[[
--※BGMの再生はコメントアウトしておきましょう。
--------SEの再生--------
--四角形の描画（先ほどのものをコピペし、新たに記述しなくても構いません。）
local rect = display.newRect(100, 100,  100, 100 )

--SEを準備します。""内が呼び出す音声ファイル
local SE = audio.loadSound( "se.mp3" )

--playSEというfunctionを作成
local function playSE( event ) 
	--イベントの状態がbeganと同じ状態、すなわちタッチ開始である場合に実行する
	if( event.phase == "began" ) then
		--SEを再生
		audio.play( SE )
		--endでif文を閉じます。
	end
	--endでfunctiuonを閉じます。
end

--四角形をタッチイベントのリスナーに指定し、イベント発生時にplaySEを呼び出しています。
rect:addEventListener( "touch", playSE )
--]]

----------------------------------------------------------------------------------------
--------ここから２限目--------
----------------------------------------------------------------------------------------

--[[
--※SEの再生はコメントアウトしておきましょう。
--------再描画アニメーション--------
--四角形の描画（先ほどのものをコピペし、新たに記述しなくても構いません。）
local rect = display.newRect(100, 100,  100, 100 )

--mRというfunctionを作成
local function mR( event )
	--四角形のx座標に１足す
	rect.x = rect.x + 1
	--四角形の角度に１足す
	rect.rotation = rect.rotation + 1
	--endでfunctiuonを閉じます。
end

--アプリをイベントリスナーとし、イベントの種類にenterFrame（画面の再描画）を指定しmRを呼び出します。
Runtime:addEventListener("enterFrame", mR )
--]]

----------------------------------------------------------------------------------------

--[[
--※再描画アニメーションはコメントアウトしておきましょう。
--------CoronaAPIでアニメーション--------
--四角形の描画（先ほどのものをコピペし、新たに記述しなくても構いません。）
local rect = display.newRect(100, 100,  100, 100 )

--apiMoveというfunctionを作成
local function apiMove( event ) 
	--イベントの状態がendedと同じ状態、すなわちタッチ終了である場合に実行する
	if( event.phase == "ended" ) then
		--オブジェクトをアニメーションさせます。()内は、アニメーションの対象, {}内に付随する設定
		transition.to( rect, {time = 1000, y = 400, } )
		--endでif文を閉じます。
	end
	--endでfunctionを閉じます。
end

--四角形をタッチイベントの対象に、apiMoveを呼び出します。
rect:addEventListener( "touch", apiMove )
--]]

----------------------------------------------------------------------------------------

--[[
--※CoronaAPIでアニメーションはコメントアウトしておきましょう。
--------物理演算の開始--------
--物理演算を利用できるように準備します。
local physics = require ( "physics")

--物理演算を開始します。
physics.start( )

--地面の四角形を描画します。
local land = display.newRect(160, 360,  320, 10 )

--地面に物理的な属性を設定します。
--()内は、物理的な属性を与える対象オブジェクト, ""は種類（staticは、その場に固定）,  {}内に付随する設定（frictionは摩擦）
physics.addBody( land, "static", { friction = 0.3 } )

--落下させる円を描画します。()内は、x座標, y座標, 円の半径です。
local circle = display.newCircle( 50, 50, 25 )

--円に物理的な属性を設定します。{}内のbounceは反発, radiusは半径です。
physics.addBody( circle, { bounce = 0.6, radius = 25 } )
--]]

----------------------------------------------------------------------------------------

--[[
--※物理演算の開始はコメントアウトしておきましょう。
--------衝突判定--------
--物理演算を利用できるように準備します。（先ほどのものをコピペし、新たに記述しなくても構いません。）
local physics = require ( "physics" )
--物理演算を開始します。（先ほどのものをコピペし、新たに記述しなくても構いません。）
physics.start( )
--地面の四角形を描画します。（先ほどのものをコピペし、新たに記述しなくても構いません。）
local land = display.newRect(160, 360,  320, 10 )
--地面に物理的な属性を設定します。（先ほどのものをコピペし、新たに記述しなくても構いません。）
physics.addBody( land, "static", { friction = 0.3 } )
--落下させる円を描画します。（先ほどのものをコピペし、新たに記述しなくても構いません。）
local circle = display.newCircle( 50, 50, 25 )
--円に物理的な属性を設定します。（先ほどのものをコピペし、新たに記述しなくても構いません。）
physics.addBody( circle, { bounce = 0.6, radius = 25 } )

--onCollisionというfunctionを作成
local function onCollision( )
	--地面の色を変更します。
	land:setFillColor( 1, 0.5, 0.04 )
	--endでfunctionを閉じます。
end

--地面を衝突イベントの対象に、onCollisionを呼び出します。
land:addEventListener( "collision", onCollision )
--]]

--表示モードを変更します。""内のhybridはオブジェクトと実態の両方、debugで物理的な実態のみを表示
--physics.setDrawMode("hybrid")

--重力の方向を設定します。()内は、x方向の重力,y方向の重力
--physics.setGravity( 10, 5 )

--isSensor = trueで衝突判定だけをするオブジェクトとなる。（質量、摩擦、反発は設定しない！）
--physics.addBody( land, "static", { isSensor = true } )

--地面を見えないオブジェクトにする記述。
--land.isVisible = false
