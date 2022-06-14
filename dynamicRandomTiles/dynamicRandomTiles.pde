color[] colorSets = {#003049, #d62828, #f77f00, #fcbf49, #eae2b7,
                    #264653, #2a9d8f, #e9c46a, #f4a261, #e76f51,
                    #355070, #6d597a, #b56576, #e56b6f, #eaac8b,
                    #e89a00, #e0c045, #e8df7a, #788c63, #36473d,
                    #b6b835, #f4e3c1, #d2c9b0, #969481, #4b5657,
                    #051a37, #779324, #9dc02e, #f2f2f2, #37465d,
                    #1c344d, #287d7d, #91c46c, #c6e070, #f2f2f2,
                    #e96151, #ecece7, #366774, #174c5b, #0f3d48,
                    #f2e9d8, #d9d1ba, #8094a6, #4c6173, #1c2f40,
                    #d8f2f0, #3e8c84, #296b73, #194759, #0f2d40,
                    #260a07, #591902, #d9631e, #f2a341, #f2ca52,
                    #8e2800, #b64926, #ffb03b, #fff0a5, #468966,
                    #499e8d, #85cc9f, #a4deab, #c8e8c7, #fff6c9,
                    #f2e205, #fffffd, #91d9d9, #4ea6a6, #347373,
                    #d0e64b, #9ac836, #33a6b2, #196674, #0a3a4a,
                    #d4a960, #ab6937, #8c3b3b, #403d3a, #637d74,
                    #3b2738, #8c4a45, #b09059, #c4be8b, #474d3d,
                    #e5effa, #f25c05, #f28705, #93a605, #3e5916,
                    #9e373e, #f2d9a0, #b1b88c, #54877e, #2b2e36,
                    #a63838, #8c3232, #3d3e3b, #5b5343, #c1ad87,
                    #16574d, #00ad68, #abe67b, #fff57e, #ff8049,
                    #f50a73, #f57ddc, #f0a08c, #f5d214, #6eb4f5,
                    #143c55, #376ea5, #5aa5d7, #82d2f5, #91e6f5,
                    #e1b496, #fff0c8, #e1d2af, #a0a5a0, #b9d2c3,
                    #beaf5f, #968c41, #6e6437, #2d2d1e, #4b281e,
                    #284655, #289b91, #ebc369, #f5a05f, #e66e50};

int imageNum = 4;
ArrayList<HRect> cubes = new ArrayList<HRect>();

void setup() {
    size(8192, 8192);
    H.init(this);
    smooth();
}

void draw() {
    if (imageNum <= 10){
        // Creating the cubes
        int [] scale = {width/12, height/12};
        int [] maxSize = {2, 2};
        int randWidth;
        int randHeight;
        stroke(#000000, 80);
        for (int row = 0; row < width; row+= randWidth) {
            randWidth = int(random(float(10), float(maxSize[0]*scale[0])));
            HRect nRect = new HRect();
            nRect.strokeWeight(1)
                .stroke(#000000, 80)
                .size(randWidth, randWidth)
                .loc(row, 0);

            H.add(nRect);
            cubes.add(nRect);
            randHeight = randWidth;
            for (int column = int(randHeight); column < height; column+= randHeight) {
                randHeight = int(random(float(10), float(maxSize[1]*scale[1])));
                HRect nRect2 = new HRect();
                nRect2.strokeWeight(1)
                    .stroke(#000000, 80)
                    .size(randWidth, randHeight)
                    .loc(row, column);

                H.add(nRect2);
                cubes.add(nRect2);
            }

        }

        // Diffuse 
        for (HRect cube : cubes) {
            cube.fill(colorSets[int(random(((imageNum*5)%colorSets.length),(((imageNum*5)+4)%colorSets.length)))]);
        }
        H.drawStage();
        // Save to file
        String nDiffuse  = String.format("T_RandomTile%03d_BaseColor_8k",imageNum);
        save(String.format("%s.tga",nDiffuse)); 

        // RMA
        for (HRect cube : cubes) {
            cube.fill(color(random(255),random(255),0));
        }
        H.drawStage();
        // Save to file
        String nRMA = String.format("T_RandomTile%03d_RMA_8k",imageNum);
        save(String.format("%s.tga",nRMA)); 

        ++imageNum;

        // clear list for next batch
        for (int i = cubes.size() - 1; i >= 0; i--) {
            cubes.remove(i);
        }
    }
}