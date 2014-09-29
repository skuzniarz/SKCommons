//
//  SKGLUtils.m
//  SKCommons
//
//  Created by szczepan on 25/09/14.
//  Copyright (c) 2014 Szczepan Kuźniarz. All rights reserved.
//

#import "SKGLUtils.h"

@implementation SKGLUtils

+ (GLuint)loadAndCompileShader:(GLenum)type fromFile:(NSString *)file {
    const GLchar *source = (GLchar *)[[NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil] UTF8String];
    if (source == NULL) {
        NSLog(@"Failed to load shader source");
        return 0;
    }
    
    GLuint shader = glCreateShader(type);
    if (shader == 0) {
        NSLog(@"Failed to create shader");
        return 0;
    }
    
    glShaderSource(shader, 1, &source, NULL);
    glCompileShader(shader);
    
#if defined(DEBUG)
    GLint logLength;
    glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &logLength);
    if (logLength > 0) {
        GLchar *log = (GLchar *)malloc(logLength);
        glGetShaderInfoLog(shader, logLength, &logLength, log);
        NSLog(@"Shader compilation info log:\n%s", log);
        free(log);
    }
#endif
    
    GLint status;
    glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
    if (status == 0) {
        NSLog(@"Failed to compile shader");
        glDeleteShader(shader);
        return 0;
    }
    
    return shader;
}

+ (GLuint)createAndLinkProgramWithVertexShader:(GLuint)vertexShader andFragmentShader:(GLuint)fragmentShader {
    GLuint program = glCreateProgram();
    if (program == 0) {
        NSLog(@"Failed to create program");
        return 0;
    }
    
    glAttachShader(program, vertexShader);
    glAttachShader(program, fragmentShader);
    
    glLinkProgram(program);
    
#if defined(DEBUG)
    GLint logLength;
    glGetProgramiv(program, GL_INFO_LOG_LENGTH, &logLength);
    if (logLength > 0) {
        GLchar *log = (GLchar *)malloc(logLength);
        glGetProgramInfoLog(program, logLength, &logLength, log);
        NSLog(@"Program linking info log:\n%s", log);
        free(log);
    }
#endif
    
    GLint status;
    glGetProgramiv(program, GL_LINK_STATUS, &status);
    if (status == 0) {
        NSLog(@"Program linking failed");
        glDeleteProgram(program);
        return 0;
    }
    
    glDetachShader(program, vertexShader);
    glDetachShader(program, fragmentShader);
    
    return program;
}

+ (GLuint)prepareProgramWithVertexShader:(NSString *)vertexShaderFile andFragmentShader:(NSString *)fragmentShaderFile {
    NSString *vertShaderPathname = [[NSBundle mainBundle] pathForResource:vertexShaderFile ofType:@"vsh"];
    NSString *fragmentShaderPathname = [[NSBundle mainBundle] pathForResource:fragmentShaderFile ofType:@"fsh"];

    GLuint vertexShader = [SKGLUtils loadAndCompileShader:GL_VERTEX_SHADER fromFile:vertShaderPathname];
    GLuint fragmentShader = [SKGLUtils loadAndCompileShader:GL_FRAGMENT_SHADER fromFile:fragmentShaderPathname];

    GLuint program = 0;
    if ((vertexShader != 0) && (fragmentShader != 0)) {
        program = [SKGLUtils createAndLinkProgramWithVertexShader:vertexShader andFragmentShader:fragmentShader];
    }
    
    glDeleteShader(vertexShader);
    glDeleteShader(fragmentShader);
    
    return program;
}

@end
