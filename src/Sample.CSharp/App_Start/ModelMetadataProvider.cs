using System.Web.Mvc;
using Code52.i18n.MVCFour.Sample.CSharp.Resources;
using ModelMetadataExtensions;

[assembly: WebActivator.PreApplicationStartMethod(typeof(Code52.i18n.MVCFour.Sample.CSharp.App_Start.ModelMetadataProvider), "Start")]
namespace Code52.i18n.MVCFour.Sample.CSharp.App_Start
{
    public static class ModelMetadataProvider
    {
        public static void Start()
        {
            ModelMetadataProviders.Current = new ConventionalModelMetadataProvider(false, typeof(Language));
        }
    }
}