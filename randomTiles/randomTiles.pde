int imageNum = 1;
void setup() {
    color [] colors = {#003049, #d62828, #f77f00, #fcbf49, #eae2b7};
    // color [] colors = {#264653, #2a9d8f, #e9c46a, #f4a261, #e76f51};
    // color [] colors = {#355070, #6d597a, #b56576, #e56b6f, #eaac8b};
    // color [] colors = {#e89a00, #e0c045, #e8df7a, #788c63, #36473d};
    // color [] colors = {#b6b835, #f4e3c1, #d2c9b0, #969481, #4b5657};
    // color [] colors = {#051a37, #779324, #9dc02e, #f2f2f2, #37465d};
    // color [] colors = {#1c344d, #287d7d, #91c46c, #c6e070, #f2f2f2};
    // color [] colors = {#e96151, #ecece7, #366774, #174c5b, #0f3d48};
    // color [] colors = {#f2e9d8, #d9d1ba, #8094a6, #4c6173, #1c2f40};
    // color [] colors = {#d8f2f0, #3e8c84, #296b73, #194759, #0f2d40};
    // color [] colors = {#260a07, #591902, #d9631e, #f2a341, #f2ca52};
    // color [] colors = {#8e2800, #b64926, #ffb03b, #fff0a5, #468966};
    // color [] colors = {#499e8d, #85cc9f, #a4deab, #c8e8c7, #fff6c9};
    // color [] colors = {#f2e205, #fffffd, #91d9d9, #4ea6a6, #347373};
    // color [] colors = {#d0e64b, #9ac836, #33a6b2, #196674, #0a3a4a};
    // color [] colors = {#d4a960, #ab6937, #8c3b3b, #403d3a, #637d74};
    // color [] colors = {#3b2738, #8c4a45, #b09059, #c4be8b, #474d3d};
    // color [] colors = {#e5effa, #f25c05, #f28705, #93a605, #3e5916};
    // color [] colors = {#9e373e, #f2d9a0, #b1b88c, #54877e, #2b2e36};
    // color [] colors = {#a63838, #8c3232, #3d3e3b, #5b5343, #c1ad87};
    // color [] colors = {#16574d, #00ad68, #abe67b, #fff57e, #ff8049};

    size(4096, 4096);
    int [] scale = {width/10, height/10};
    int [] maxSize = {2, 2};
    int randWidth;
    int randHeight;
    stroke(#000000, 80);
    for (int row = 0; row < width; row+= randWidth) {
        randWidth = int(random(float(10), float(maxSize[0]*scale[0])));
        fill(colors[int(random(0,colors.length))]);
        rect(row, 0, randWidth, randWidth);
        randHeight = randWidth;
        for (int column = int(randHeight); column < height; column+= randHeight) {
            randHeight = int(random(float(10), float(maxSize[1]*scale[1])));
            fill(colors[int(random(0,colors.length))]);
            rect(row, column, randWidth, randHeight);
        }
    }
    // Save to file
    String fileName = String.format("T_RandomeTile%02d_BaseColor_4K",imageNum);
    save(String.format("%s.tga",fileName)); 
}