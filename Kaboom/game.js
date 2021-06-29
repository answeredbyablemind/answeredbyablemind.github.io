kaboom({
    global: true,
    fullscreen: true,
    scale: 1, 
    debug: true,
    clearColor: [0, 0, 0, 1],
})
// https://www.youtube.com/watch?v=2nucjefSr6I&list=WL&index=1&ab_channel=CodewithAniaKub%C3%B3w
loadRoot('https://i.imgur.com/')
loadSprite('coin','wbKxhcd.png')
loadSprite('evil-shroom', 'KPO3fR9.png')
loadSprite('brick', 'pogC9x5.png')
loadSprite('block', '3e5YRQd.png')
loadSprite('mario', 'Wb1qfhK.png')
loadSprite('mushroom', '0wMd92p.png')
loadSprite('surprise', 'gesQ1KP.png')
loadSprite('unboxed', 'bdrLpi6.png')
loadSprite('pipe-top-left', 'ReTPiWY.png')
loadSprite('pipe-top-right', 'hj2GK4n.png')
loadSprite('pipe-bottom-left', 'c1cYSbt.png')
loadSprite('pipe-bottom-right', 'nqQ79eI.png')


scene("game", () => {
    layers(['bg','obj','ui'],'obj')


})

start("game")