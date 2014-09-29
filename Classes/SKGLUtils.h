//
//  SKGLUtils.h
//  SKCommons
//
//  Created by szczepan on 25/09/14.
//  Copyright (c) 2014 Szczepan Kuźniarz. All rights reserved.
//

#import <OpenGLES/ES2/gl.h>

@interface SKGLUtils : NSObject

/**
 * Loads and compiles shader from text file. Type must be one of GL_VERTEX_SHADER or GL_FRAGMENT_SHADER.
 * Returns non-zero shader number if file was loaded and shader was compiled. Returns 0 if an error occured.
 */
+ (GLuint)loadAndCompileShader:(GLenum)type fromFile:(NSString *)file;

/**
 * Links program. Returns non-zero program number if the program was linked.
 * Returns 0 if an error occured.
 */
+ (GLuint)createAndLinkProgramWithVertexShader:(GLuint)vertexShader andFragmentShader:(GLuint)fragmentShader;

/**
 * Loads vertex and fragment shaders, compiles them and links program.
 * Returns non-zero program number if both shaders was loaded and compiled, and the program was linked.
 * Returns 0 if an error occured.
 */
+ (GLuint)prepareProgramWithVertexShader:(NSString *)vertexShaderFile andFragmentShader:(NSString *)fragmentShaderFile;

@end
