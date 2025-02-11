# BetterRoundBoxesGmod
 Оптимизированный рендеринг закругленных квадратов в Garry's mod

<!-- ### Настоятельно рекомендую использовать [менее оптимизированную версию](https://github.com/maksimslv1/BetterRoundBoxesGmod/tree/AnimationsLovers) на случай использования этой библиотеки с анимациями. Она сохранит оперативную память -->

## Использование:

### Аналог `draw.RoundedBoxEx`
#### [`betterRB.DrawRoundedBoxEx`](https://github.com/maksimslv1/BetterRoundBoxesGmod/blob/master/betterroundbox.lua#L37-L41)( `number` cornerRadius, `number` x, `number` y, `number` width, `number` height, `table` color, `boolean` roundTopLeft = false, `boolean` roundTopRight = false, `boolean` roundBottomLeft = false, `boolean` roundBottomRight = false ) -> nil


### Аналог `draw.RoundedBox`
#### [`betterRB.DrawRoundedBox`](https://github.com/maksimslv1/BetterRoundBoxesGmod/blob/master/betterroundbox.lua#L43-L47)( `number` cornerRadius, `number` x, `number` y, `number` width, `number` height, `table` color ) -> nil

### Функция для получения материала нужного размера с нужным закруглением
#### [`betterRB.GetRoundedBoxMaterial`](https://github.com/maksimslv1/BetterRoundBoxesGmod/blob/master/betterroundbox.lua#L11-L35)( `number` cornerRadius, `number` w, `number` h, `boolean` tl, `boolean` tr, `boolean` bl, `boolean` br ) -> iMaterial

## Важно
 Если вы хотите использовать эту библиотеку вместе с анимациями наподобие `Panel:SizeTo` - удостоверьтесь, что функции оптимизированного рендеринга не вызываются. Иначе вы забьёте оперативную память ненужным кэшом.