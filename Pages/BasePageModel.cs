using System.Threading.Tasks;
using BTCPayServer.Data;
using BTCPayServer.Plugins.LNbank.Data.Models;
using BTCPayServer.Plugins.LNbank.Services.Wallets;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.RazorPages;

// https://dotnetstories.com/blog/How-to-implement-a-custom-base-class-for-razor-views-in-ASPNET-Core-en-7106773524?o=rss
namespace BTCPayServer.Plugins.LNbank.Pages;

public abstract class BasePageModel : PageModel
{
    protected readonly UserManager<ApplicationUser> UserManager;
    protected readonly WalletService WalletService;
    protected readonly WalletRepository WalletRepository;
    
    protected string UserId => UserManager.GetUserId(User);
        
    protected BasePageModel(
        UserManager<ApplicationUser> userManager,
        WalletRepository walletRepository,
        WalletService walletService)
    {
        UserManager = userManager;
        WalletService = walletService;
        WalletRepository = walletRepository;
    }

    protected async Task<Wallet> GetWallet(string userId, string walletId)
    {
        return await WalletRepository.GetWallet(new WalletsQuery {
            UserId = new []{ UserId },
            WalletId = new []{ walletId },
            IncludeTransactions = true
        });
    }
}
