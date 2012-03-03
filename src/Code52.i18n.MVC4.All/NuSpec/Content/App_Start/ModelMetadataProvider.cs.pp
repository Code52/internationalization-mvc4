using System.Web.Mvc;
using $rootnamespace$.Resources;
using ModelMetadataExtensions;

[assembly: WebActivator.PreApplicationStartMethod(typeof($rootnamespace$.App_Start.ModelMetadataProvider), "Start")]
namespace $rootnamespace$.App_Start
{
    public static class ModelMetadataProvider
    {
        public static void Start()
        {
            ModelMetadataProviders.Current = new ConventionalModelMetadataProvider(false, typeof(Language));
        }
    }
}