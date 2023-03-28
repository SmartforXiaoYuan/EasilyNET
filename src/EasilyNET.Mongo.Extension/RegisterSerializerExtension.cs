﻿using Microsoft.Extensions.DependencyInjection;
using MongoDB.Bson.Serialization;
using MongoDB.Bson.Serialization.Serializers;

// ReSharper disable UnusedMethodReturnValue.Global
// ReSharper disable MemberCanBePrivate.Global
// ReSharper disable UnusedMember.Global
// ReSharper disable UnusedType.Global

namespace EasilyNET.Mongo.Extension;

/// <summary>
/// 服务注册扩展类
/// </summary>
public static class RegisterSerializerExtension
{
    /// <summary>
    /// 添加(DateOnly,TimeOnly)类型序列化支持
    /// </summary>
    /// <param name="services"></param>
    /// <returns></returns>
    public static IServiceCollection RegisterSerializer(this IServiceCollection services)
    {
        BsonSerializer.RegisterSerializer(new DateOnlySerializer());
        BsonSerializer.RegisterSerializer(new TimeOnlySerializer());
        return services;
    }

    /// <summary>
    /// 添加自定义序列化规则
    /// </summary>
    /// <typeparam name="T">数据类型</typeparam>
    /// <param name="services">IServiceCollection</param>
    /// <param name="serializer">自定义序列化类</param>
    /// <returns></returns>
    public static IServiceCollection RegisterSerializer<T>(this IServiceCollection services, IBsonSerializer<T> serializer) where T : struct
    {
        BsonSerializer.RegisterSerializer(serializer);
        return services;
    }

    /// <summary>
    /// 注册动态类型(dynamic|object)序列化支持
    /// </summary>
    /// <param name="services"></param>
    /// <returns></returns>
    public static IServiceCollection RegisterDynamicSerializer(this IServiceCollection services)
    {
#pragma warning disable IDE0048
        var objectSerializer = new ObjectSerializer(type => ObjectSerializer.DefaultAllowedTypes(type) || type.FullName is not null && type.FullName.StartsWith("<>f__AnonymousType"));
#pragma warning restore IDE0048
        BsonSerializer.RegisterSerializer(objectSerializer);
        return services;
    }
}