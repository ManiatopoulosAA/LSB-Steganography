# LSB-Steganography
Least Significant Bit Steganography

Theoretical background
  The encryption technique is based on changing the last bit of each pixel, changing the 
pixel value by one, with an average pixel value of 128 to 8bit images, while only half
the pixels are likely to change since only two are possible values ( 0 or 1). Therefore,
the image changes only by 1/256 as a whole, much less than the deterioration caused by 
jpg compression.

  The hidden image is converted to bitstream, with every 8 bits representing one pixel. 
Then every last bit of a pixel of the large image is replaced with the hidden bit. 
Therefore every 8 pixels of the large image incorporate one pixel of the hidden image.
The original image is not distorted to show the difference with the naked eye or simple
optical sensors. The only limitation of the algorithm is coding, which must necessarily 
be lossless. This is how png images are used.

  When decrypting the code follows the reverse procedure, forming the pixel of the hidden
image by 8 pixels of the sent, and finally displaying it and saving it to a png file.

Instructions for program execution

  The code is divided into two parts. The first encrypts the image (LSB_Encrypt) and the 
second encrypts the saved file and extracts the hidden image (LSB_Decrypt). In encryption,
the user selects two images, the mask and the hidden one. The concealed image is scaled 
exactly 8 times smaller than the mask, and is coded in the large image. After decryption
the hidden image is upscaled to its original size in order to improve the visual effect by
interpolation techniques.
