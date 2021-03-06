import cv2
if __name__ == "__main__":
    txtfile = open('price.txt','a')
    img_path = 'underground.png'
    cover_path = 'ss.jpg'
    img = cv2.imread(img_path)
    img = cv2.resize(img,(640,480))
    print(img.shape)
    
    # cv2.namedWindow('depth', cv2.WINDOW_AUTOSIZE)
    height = img.shape[0]
    weight = img.shape[1]
    channels = img.shape[2]
    for row in range(height):
        for col in range(weight):
            for c in range(channels):  #BGR
                pv = img[row,col,c]
                pv2 = pv // 16
                pv3 = 16 * pv2
                img[row,col,c] = pv3
                # pv2.tostring()
                # ssr = hex(pv2)
                # ssr = str(ssr)
                # ssr = ssr[2]
            #     txtfile.write(ssr)
            # txtfile.write(',\r') 
    cv2.imwrite(cover_path,img)     
    print(img)   
    # cv2.imshow('depth', img)
    # key = cv2.waitKey(0)
    # if key & 0xFF == ord('q') or key == 27:
    #     cv2.destroyAllWindows()