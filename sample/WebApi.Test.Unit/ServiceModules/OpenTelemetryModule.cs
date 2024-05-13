﻿using EasilyNET.AutoDependencyInjection.Contexts;
using EasilyNET.AutoDependencyInjection.Modules;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using OpenTelemetry.Exporter;
using OpenTelemetry.Metrics;
using OpenTelemetry.Trace;

namespace WebApi.Test.Unit;

/// <summary>
/// OpenTelemetry相关内容
/// </summary>
public sealed class OpenTelemetryModule : AppModule
{
    /// <inheritdoc />
    public override void ConfigureServices(ConfigureServicesContext context)
    {
        // OpenTelemetry
        var config = context.Services.GetConfiguration();
        var env = context.Services.GetWebHostEnvironment();
        context.Services.AddOpenTelemetry()
               .WithMetrics(c =>
               {
                   c.AddRuntimeInstrumentation();
                   c.AddMeter([
                       "Microsoft.AspNetCore.Hosting",
                       "Microsoft.AspNetCore.Server.Kestrel",
                       "System.Net.Http",
                       "WebApi.Test.Unit"
                   ]);
                   c.AddOtlpExporter();
               })
               .WithTracing(c =>
               {
                   if (env.IsDevelopment())
                   {
                       c.SetSampler<AlwaysOnSampler>();
                   }
                   c.AddAspNetCoreInstrumentation();
                   c.AddHttpClientInstrumentation();
                   c.AddGrpcClientInstrumentation();
                   c.AddOtlpExporter();
               });
        context.Services.Configure<OtlpExporterOptions>(c =>
        {
            if (!string.IsNullOrWhiteSpace(config["DASHBOARD__OTLP__PRIMARYAPIKEY"]))
            {
                c.Headers = $"x-otlp-api-key={config["DASHBOARD__OTLP__PRIMARYAPIKEY"]}";
            }
        });
        context.Services.AddHealthChecks().AddCheck("self", () => HealthCheckResult.Healthy(), ["live"]);
        context.Services.ConfigureHttpClientDefaults(c => c.AddStandardResilienceHandler());
        context.Services.AddMetrics();
    }
}