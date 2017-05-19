//
//  RegisterUserViewController.m
//  Rest Insured
//
//  Created by Brandon Little on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "RegisterUserViewController.h"
#import "UserSignupAPI.h"

@import SearchTextField;

@interface RegisterUserViewController ()
@property (weak, nonatomic) IBOutlet UITextField *registerFullName;
@property (weak, nonatomic) IBOutlet UITextField *registerEmailAddress;
@property (weak, nonatomic) IBOutlet UITextField *registerPassword;
@property (weak, nonatomic) IBOutlet SearchTextField *insuranceProvider;

@property (strong, nonatomic) NSArray *providers;
@property (strong, nonatomic) User *registeredUser;

@end

@implementation RegisterUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    
    self.registerFullName.delegate = self;
    self.registerEmailAddress.delegate = self;
    self.registerPassword.delegate = self;
    self.insuranceProvider.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)registerButtonPressed:(UIButton *)sender {

    [UserSignupAPI userSignUpWithFullName:self.registerFullName.text email:self.registerEmailAddress.text password:self.registerPassword.text providerID:self.insuranceProvider.text andCompletion:^(User *currentUser) {
        self.registeredUser = currentUser;
    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:nil completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([self.insuranceProvider isTouchInside]) {
        [self animateTextField:self.insuranceProvider up:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([self.insuranceProvider isTouchInside]) {
        [self animateTextField:self.insuranceProvider up:NO];
    }
}

- (void)animateTextField:(UITextField*)textField up:(BOOL)moveUp{
    int movementDistance = -180;
    float movementDuration = 0.3;
    int movement = 0;
    if (moveUp) {
        movement = movementDistance;
    } else {
        movement = -movementDistance;
    }
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

-(void)viewDidAppear:(BOOL)animated{
    NSArray *providersList = @[@"advantagehealthsolutions-advantagehealth360main",
                               @"aetna-aetnaadvantage6350hix",
                               @"aetna-aetnaadvantage6350",
                               @"aetna-aetnabasichmo",
                               @"aetna-aetnachoiceposii",
                               @"aetna-aetnachoiceposopenaccess",
                               @"aetna-aetnadmo",
                               @"aetna-aetnadppo",
                               @"aetna-aetnaelectchoiceepo",
                               @"aetna-aetnahmo",
                               @"aetna-aetnahmodeductibleplancamembersonly",
                               @"aetna-aetnahealthnetworkoptionopenaccess",
                               @"aetna-aetnamanagedchoiceposopenaccess",
                               @"aetna-aetnasavingsplusofaz",
                               @"aetna-aetnasavingsplusofca",
                               @"aetna-aetnaselect",
                               @"aetna-aetnasignatureadministratorsppo",
                               @"aetna-aetnavitalidadpluscaconaetna",
                               @"aetna-aetnawholehealthbannerhealthnetworkhmo",
                               @"aetna-aetnawholehealthcoloradofrontrange",
                               @"aetna-aetnawholehealthprimecarehmoca",
                               @"aetna-aetnawholehealthprimecareoamcca",
                               @"aetna-aetnabasichix",
                               @"aetna-aetnamdbronzesilverandgoldhmo",
                               @"altiuscoventryhealthcare-altiusproviderdirectory",
                               @"ambettersuperiorhealthplan-ambettersuperiorhealthplan",
                               @"amerihealth-amerihealthlocalvaluenetworkepoposppo",
                               @"amerihealth-amerihealthlocalvaluenetworkhmohmopos",
                               @"amerihealth-amerihealthregionalprefntwkepoposppo",
                               @"amerihealth-amerihealthregionalprefntwkhmohmopos",
                               @"ameritas-ameritasppo",
                               @"anthem-anthemblueaccessppo",
                               @"anthem-anthemblueopenaccesspos",
                               @"anthem-anthembluepreferredhmo",
                               @"anthem-anthembluepreferredpluspos",
                               @"anthem-anthembluepreferredselect",
                               @"anthem-anthemcobluepriorityppo",
                               @"anthem-anthemcopathway",
                               @"anthem-anthemcopathwayxenhancedinddirectaccess",
                               @"anthem-anthemhealthkeepershmopos",
                               @"anthem-antheminpathwayxbronzedirectcacahix",
                               @"anthem-anthemkypathwayxinddirectaccess",
                               @"anthem-anthemkeycareppo",
                               @"anthem-anthemmodirectaccesswhsa",
                               @"anthem-anthemnvpathwayppo",
                               @"anthem-anthemnvpathwayxhmoinddirectaccess",
                               @"anthem-anthemohpathwayxtieredhospinddirectaccess",
                               @"anthem-anthemppo",
                               @"anthem-anthemppocenturypreferredct",
                               @"anthem-anthempathwayxenhancedinddirectaccessnh",
                               @"anthem-anthempathwayxenhancedindguidedaccessme",
                               @"anthem-anthempathwayxindppodirectaccessct",
                               @"anthem-anthempathwayxtierhosphealthkeepersdirectaccessva",
                               @"anthem-anthemwibluepriorityxindivdirectaccess",
                               @"bluecrosscalifornia-bccadentalblue100200300",
                               @"bluecrosscalifornia-bluecrosscaadvantageppopreferreddirectaccessplus",
                               @"bluecrosscalifornia-bluecrosscacaliforniacarehmo",
                               @"bluecrosscalifornia-bluecrosscappo",
                               @"bluecrosscalifornia-bluecrosscapathwayxhmoguidedaccess",
                               @"bluecrosscalifornia-bluecrosscapathwayxppodirectaccess",
                               @"bluecrosscalifornia-bluecrosscapathwayxtiereddirectaccess",
                               @"bluecrosscalifornia-bluecrosscapowerselecthmo",
                               @"bluecrosscalifornia-bluecrosscapriorityselecthmo",
                               @"bluecrosscalifornia-bluecrosscaselectppo",
                               @"bluecrosscalifornia-bluecrosscaselectplushmo",
                               @"anthem-blueviewvision",
                               @"anthembluecrossblueshield-bronzedirectaccessplusgjqa",
                               @"anthembluecrossblueshield-golddirectaccesspluswhsa",
                               @"assurant-assurantdha",
                               @"assurant-assurantdhapremier",
                               @"aultcare-aultcareppo",
                               @"bcbsbluecard-bcbsbluecardppo",
                               @"bcbsminnesota-bcbsmnbluecrossaccord",
                               @"bluecrossbluesheildofalabama-bcbsalppo",
                               @"bluecrossbluesheildofalabama-bcbsalpreferreddentists",
                               @"bluecrossblueshieldofaritona-bcbsazalliance",
                               @"bluecrossblueshieldofflorida-flbluebluedentalchoicechoiceplusppo",
                               @"bluecrossblueshieldofflorida-floridabluebluecarehmo",
                               @"bluecrossblueshieldofflorida-floridablueblueoptions",
                               @"bluecrossblueshieldofflorida-floridablueblueselect",
                               @"bluecrossblueshieldofflorida-floridabluenetworkblue",
                               @"bcbsflorida-floridablueblueoptionshix",
                               @"bluecrossblueshieldofgeorgia-bcbsgabluechoicehmo",
                               @"bluecrossblueshieldofgeorgia-bcbsgabluechoiceppo",
                               @"bluecrossblueshieldofgeorgia-bcbsgablueopenaccesspos",
                               @"bluecrossblueshieldofgeorgia-bcbsgabluechoiceoptionpos",
                               @"bluecrossblueshieldofgeorgia-bcbsgadentalcomplete",
                               @"bluecrossblueshieldofgeorgia-bcbsgadirectaccesswhsa",
                               @"bluecrossblueshieldofillinois-bcbsilblueadvantagehmo",
                               @"bluecrossblueshieldofillinois-bcbsilblueprecisionhmo",
                               @"bluecrossblueshieldofillinois-bcbsilbluechoiceselect",
                               @"bluecrossblueshieldofillinois-bcbsilhmoillinois",
                               @"bluecrossblueshieldofillinois-bcbsilppo",
                               @"bluecrossblueshieldofkansascity-bcbskcpreferredcareblueppo",
                               @"bluecrossblueshieldoflouisiana-bcbslabluecrossdentalnetwork",
                               @"bluecrossblueshieldoflouisiana-bcbslablueconnecthmopos",
                               @"bluecrossblueshieldoflouisiana-bcbslacommunitybluehmopos",
                               @"bluecrossblueshieldofmassachusetts-bcbsmabluecareelectppo",
                               @"bluecrossblueshieldofmassachusetts-bcbsmahmobluewithmanagedcarebehavioralhealth",
                               @"bluecrossblueshieldofmassachusetts-bcbsmapreferredblueppo",
                               @"bluecrossblueshieldofmichigan-bcbsmibluecarenetwork",
                               @"bluecrossblueshieldofmichigan-bcbsmibluecarenetworkpcpfocusnetwork",
                               @"bluecrossblueshieldofmichigan-bcbsmippoplansgroupemployees",
                               @"bluecrossblueshieldofnewmexico-bcbsnmpponm",
                               @"bluecrossblueshieldofoklahoma-bcbsokbluechoice",
                               @"bluecrossblueshieldofrhodeisland-bcbsrihealthmatecoasttocoast",
                               @"bluecrossblueshieldoftx-bcbstxbluecaredental",
                               @"bluecrossblueshieldoftx-bcbstxdentablue",
                               @"bluecrossblueshieldoftennessee-bcbstnbluenetworke",
                               @"bluecrossblueshieldoftennessee-bcbstnnetworks",
                               @"bluecrossblueshieldoftexas-bcbsncblueoptionsgroupppo",
                               @"bluecrossblueshieldoftexas-bcbstxblueadvantagehmo",
                               @"bluecrossblueshieldoftexas-bcbstxbluechoice",
                               @"bcbstexas-bcbstxblueadvantagehmohix",
                               @"bluecrossblueshieldofwyoming-bcbswybluechoicepersonal",
                               @"bluecrossidaho-bluecrossidppo",
                               @"blueshieldofcalifornia-bscadentalppo",
                               @"blueshieldofcalifornia-bscaplatinum90epo",
                               @"blueshieldofcalifornia-bscatrioacohmo",
                               @"blueshieldofcalifornia-blueshieldcabasicepobronzelevelhix",
                               @"blueshieldofcalifornia-blueshieldcabasicppobronzelevelhix",
                               @"blueshieldofcalifornia-blueshieldcaaccessplushmo",
                               @"blueshieldofcalifornia-blueshieldcaaccessplussavenet",
                               @"blueshieldofcalifornia-blueshieldcabasicepo",
                               @"blueshieldofcalifornia-blueshieldcabasicexclusiveppoforsmallbusiness",
                               @"blueshieldofcalifornia-blueshieldcabasicppo",
                               @"blueshieldofcalifornia-blueshieldcaenhancedexclusivehmoforsmallbusiness",
                               @"blueshieldofcalifornia-blueshieldcalocalaccessplushmo",
                               @"blueshieldofcalifornia-blueshieldcappo",
                               @"bluegrassfamilyhealth-bluegrassfamilyhealthppo",
                               @"bridgespan-bridgespanhix",
                               @"buckeyecommunityhealthplan-ambetterfrombuckeyecommunityhealthplanhix",
                               @"capitalbluecross-capitalbckeystonehealthplancentralhmo",
                               @"capitalbluecross-capitalbcppo",
                               @"capitaldistrictphysicianshealthplan-cdphphmo",
                               @"capitaldistrictphysicianshealthplan-cdphpppo",
                               @"carefirstbluecrossblueshield-carefirstbluechoiceadvantage",
                               @"carefirstbluecrossblueshield-carefirstbluechoicentwkpos",
                               @"carefirstbluecrossblueshield-carefirstbluepreferredppo",
                               @"carefirstbluecrossblueshield-carefirstmarylandpos",
                               @"carefirstbluecrossblueshield-carefirstregionalpreferreddentalppo",
                               @"carefirstbluecrossblueshield-carefirstregionaltraditionaldental",
                               @"chinesecommunityhealthplan-chinesecommunityhealthplan",
                               @"cigna-cignahmo",
                               @"cigna-cignalocalplus",
                               @"cigna-cignaopenaccessplus",
                               @"cigna-cignappo",
                               @"cigna-vision",
                               @"cignadental-cignadentaldhmo",
                               @"cignadental-cignatotaldppo",
                               @"cofinity-cofinityppo",
                               @"communitycarehealthcenters-communitycareppostandardnetwork",
                               @"communitycarehealthcenters-communitycareplusposstandardnetwork",
                               @"compbenefitscorporation-compbenefitsadvantageplusplans",
                               @"compbenefitscorporation-compbenefitsdentalaccessplan",
                               @"compbenefitscorporation-compbenefitsppo",
                               @"connecticare-connecticareflexpos",
                               @"connecticare-connecticarehmoopenaccess",
                               @"coventryhealthcare-carelinkppowv",
                               @"coventryhealthcare-coventrycarelinkhmohix",
                               @"coventryhealthcare-coventrycarelinkhmofl",
                               @"coventryhealthcare-coventryemployergrouphmoopenaccessfl",
                               @"coventryhealthcare-coventryemployergroupppofl",
                               @"coventryhealthcare-coventryfreedomppook",
                               @"coventryhealthcare-coventryhealthlifeilppo",
                               @"coventryhealthcare-coventryhealthcareofnevadappo",
                               @"coventryhealthcare-coventryhealthcareofvahmo",
                               @"coventryhealthcare-coventryhealthamericahmo",
                               @"coventryhealthcare-coventryhealthamericappo",
                               @"coventryhealthcare-coventryiappo",
                               @"coventryhealthcare-coventryilppo",
                               @"coventryhealthcare-coventryilppoplatinum",
                               @"coventryhealthcare-coventryksppo",
                               @"coventryhealthcare-coventrylifehealthok",
                               @"coventryhealthcare-coventrymohmopos",
                               @"coventryhealthcare-coventrymoppo",
                               @"coventryhealthcare-coventryneppo",
                               @"coventryhealthcare-coventryppode",
                               @"coventryhealthcare-coventryppotn",
                               @"coventryhealthcare-coventrysouthernhealthppo",
                               @"coventryhealthcare-coventryutpeakadvantage",
                               @"coventryhealthcare-coventrywellpathpreferredppo",
                               @"coventryhealthcare-coventryonehmohix",
                               @"coventryhealthcare-coventryonehmo",
                               @"deltadental-deltadentaldeltacareusa",
                               @"deltadental-deltadentalppo",
                               @"deltadental-deltadentalpremier",
                               @"dentalnetworkofamerica-dentalnetworkofamericadppo",
                               @"dentemax-dentemaxdental",
                               @"diversifieddental-diversifieddentalppo",
                               @"dominiongroup-dominiondentalppo",
                               @"emblemhealth-emblemdentalpreferredplus",
                               @"emblemhealth-emblemhealthppoghi",
                               @"empirebcbs-empirehmo",
                               @"empirebcbs-empireppo",
                               @"empirebcbs-empirepathwayenhancedguidedaccess",
                               @"empirebcbs-empireprismepobluepriority",
                               @"excellusbcbs-excellusblueppo",
                               @"excellusbcbs-excellushmoblue",
                               @"firstchoice-firstchoice",
                               @"firstdentalhealth-firstdentalhealth",
                               @"firsthealthcoventryhealthcare-firsthealthppo",
                               @"gwhcigna-greatwestppo",
                               @"geisingerhealthplan-geisingerhealthplan",
                               @"grouphealthcooperative-grouphealthcoopalliantplusconnect",
                               @"grouphealthcooperative-grouphealthcoopcore",
                               @"guardiandental-guardiandentalguardpreferred",
                               @"guardiandental-guardianmanageddentalcare",
                               @"guardiandental-guardianmanageddentalguard",
                               @"gundersenhealthplan-gundersenhealthplanselectnetwork",
                               @"hap-happpo",
                               @"hap-happreferredppo",
                               @"hipofny-emblemhipselectppo",
                               @"hmsa-hmsapreferredprovidercompmed",
                               @"harvardpilgrim-harvardpilgrimppo",
                               @"healthalliance-healthalliancehmopos",
                               @"healthalliance-healthallianceppo",
                               @"healthnet-bluegoldhmo",
                               @"healthnet-hmoexcelcaresilvernetwork",
                               @"healthnet-hmoexcelcaresilvernetworkmedicarecob",
                               @"healthnet-healthnetazhmoexcelcarenetwork",
                               @"healthnet-healthnetazppopos",
                               @"healthnet-healthnetcabluegoldhmo",
                               @"healthnet-healthnetcacommunitycarenetworkhmo",
                               @"healthnet-healthnetcacoveredcaliforniapposmallgroup",
                               @"healthnet-healthnetcahmoemployergroup",
                               @"healthnet-healthnetcahmosmartcare",
                               @"healthnet-healthnetcahmowholecarenetwork",
                               @"healthnet-healthnetcaindividualfamilyppo",
                               @"healthnet-healthnetcalargegroupppo",
                               @"healthnet-healthnetcaprimaryepo",
                               @"healthnet-healthnetcommunitycarenetworkhmohix",
                               @"healthnet-healthnetindividualfamilyppohix",
                               @"healthnet-healthnetorcommunitycare",
                               @"healthnet-healthnetorppo",
                               @"healthplanofnevada-healthplanofnvhmonorthernnv",
                               @"healthplanofnevada-healthplanofnvhmoruralnv",
                               @"healthplanofnevada-healthplanofnvhmosouthernnv",
                               @"healthfirstny-healthfirstnyhmoabcd",
                               @"healthlink-healthlinkppo",
                               @"healthnow-healthnowppo",
                               @"healthplusofmichigan-healthplushmo",
                               @"healthspan-healthspanaccessppo",
                               @"highmarkbluecrossblueshield-highmarkcommunityblueppo",
                               @"highmarkbluecrossblueshield-highmarkppoblue",
                               @"homestatehealthplan-homestatehealthplan",
                               @"horizonbcbs-horizonadvanceepo",
                               @"horizonbcbs-horizondentalppo",
                               @"horizonbcbs-horizondirectaccess",
                               @"horizonbcbs-horizonhmo",
                               @"horizonbcbs-horizonpos",
                               @"horizonbcbs-horizonppo",
                               @"humana-humanaatlantahmoxhix",
                               @"humana-humanaaustinhmoxhix",
                               @"humana-humanacohmoxhix",
                               @"humana-humanacolumbusgahmoxhix",
                               @"humana-humanahmopremierhix",
                               @"humana-humanaatlantahmox",
                               @"humana-humanachoicecarenetworkppo",
                               @"humana-humanacolumbusgahmox",
                               @"humana-humanadentalppo",
                               @"humana-humanagoldplushmo",
                               @"humana-humanahmoselect",
                               @"humana-humanahoustonhmox",
                               @"humana-humanaphoenixhmox",
                               @"humana-humanapreferredppo",
                               @"humana-humanasouthfloridahumxhmox",
                               @"humana-humanatampabaycorenet",
                               @"humana-humanatampabayhumxhmox",
                               @"humana-humanatucsonhmox",
                               @"humana-humanariograndeepoxhix",
                               @"humana-humanasanantoniohmoxhix",
                               @"humana-humanasouthfloridahumxhmoxhix",
                               @"humana-humanatampabayhumxhmoxhix",
                               @"humana-humanawacohmoxhix",
                               @"ibcamerihealth-amerihealthlocalvaluenetworkepoposppohix",
                               @"ibcamerihealth-amerihealthlocalvaluenetworkhmohmoposhix",
                               @"ibcamerihealth-amerihealthregionalprefntwkepoposppohix",
                               @"ibcamerihealth-amerihealthregionalprefntwkhmohmoposhix",
                               @"independencebluecross-ibckeystonehmopos",
                               @"independencebluecross-ibcpersonalchoiceppo",
                               @"independenthealthassociation-independenthealthencompasshmo",
                               @"independenthealthassociation-independenthealthflexfithmo",
                               @"kaisermidatlantic-kaiserpermanentemidatlantic",
                               @"kaiserpermanente-kaiserpermanente",
                               @"lacarehealth-lacare",
                               @"lacarehealth-lacarecoveredhix",
                               @"libertydentalplan-libertydentalcaindependenceppo",
                               @"lifewisehealthplanoforegon-lifewisehealthplanoforegon",
                               @"mhsindiana-ambetterfrommhshix",
                               @"mhealthinsured-mhealthinsured",
                               @"mvphealthplan-mvphmo",
                               @"mvphealthplan-mvppreferredppo",
                               @"magnacare-magnacareextrahealthrepublichix",
                               @"magnacare-magnacareppo",
                               @"medicaid-medicaid",
                               @"medicalmutualofohio-mmohsupermedpos",
                               @"medicalmutualofohio-mmohsupermedplus",
                               @"medicare-medicare",
                               @"metlife-metlifehmo",
                               @"metlife-metlifepdp",
                               @"molinahealthcare-molinamrktplacecahix",
                               @"molinahealthcare-molinamrktplaceca",
                               @"multiplan-multiplanppo",
                               @"multiplan-phcsppo",
                               @"multiplan-phcsppokaiser",
                               @"odshealthplan-odsnetwork",
                               @"oxfordhealth-oxfordfreedom",
                               @"oxfordhealth-oxfordliberty",
                               @"pacificsourcehealthplans-pacificsourcepreferredpsn",
                               @"paramount-paramountohiohmopico",
                               @"premerabluecross-premeraheritageheritageplus1",
                               @"premerabluecross-premeraheritagesignature",
                               @"premerabluecross-premeralifewiseconnect",
                               @"premerabcbs-lifewiseconnecthix",
                               @"premerabcbs-premeraheritagesignaturehix",
                               @"presbyterianhealthcareservices-presbyteriancommercial",
                               @"principalfinancialservices-principaldentalppo",
                               @"priorityhealth-priorityhealthhmo",
                               @"priorityhealth-priorityhealthpriorityppo",
                               @"providencehealthsystem-providencepersonaloption",
                               @"providencehealthsystem-providencepreferredppo",
                               @"qualcare-qualcarehmo",
                               @"qualcare-qualcareppo",
                               @"qualchoice-qualchoiceppo",
                               @"regencebluecrossblueshieldoforegon-regenceorpreferredprovidernetwork",
                               @"regencebluecrossblueshieldofutah-regencevaluecare",
                               @"regenceblueshieldofidaho-regenceidpreferredprovidernetwork",
                               @"regenceblueshieldofwashinton-regencewapreferredprovidernetwork",
                               @"rockymountainhealthplans-rockymountainsummitgroup",
                               @"sagamorehealthnetwork-sagamoreplus",
                               @"sciondental-sciondental",
                               @"scottandwhite-scottandwhiteppo",
                               @"sharphealthplan-sharpbluechoice",
                               @"sharphealthplan-sharpgoldvalue",
                               @"sharphealthplan-sharphealthperformance",
                               @"sharphealthplan-sharphealthperformancehix",
                               @"sharphealthplan-sharphealthpremier",
                               @"sharphealthplan-sharphealthpremierhix",
                               @"sierrahealth-sierrahealthnorthernnevadappo",
                               @"sierrahealth-sierrahealthsouthernnevadappo",
                               @"spectrumhealth-spectrumhealth",
                               @"totaldentaladministrators-totaldentaladministratorsppo",
                               @"totalhealthplan-totalhealthplanemployersponsoredhmo",
                               @"tuftshealthplan-tuftsppo",
                               @"uhcwestformerlypacificare-pacificarehmo",
                               @"uhcwestformerlypacificare-uhcwestsignaturevalueadvantagehmovaluenetwork",
                               @"uhcwestformerlypacificare-uhcwestsignaturevaluealliance",
                               @"uhcoftherivervalley-neighborhoodhealthpartnershipcommercial",
                               @"unitedconcordia-unitedconcordiaadvantageplusppo",
                               @"unitedconcordia-unitedconcordiadhmoconcordiaplusgeneraldentist",
                               @"unitedconcordia-unitedconcordianationalfeeforservice",
                               @"unitedhealthcare-uhcchoicepluspos",
                               @"unitedhealthcare-uhcmedicachoice",
                               @"unitedhealthcare-uhcnavigatehmo",
                               @"unitedhealthcare-uhcnavigatepos",
                               @"unitedhealthcare-uhcoptionsppo",
                               @"unitedhealthcaredental-unitedhealthcaredentaldhmocaonly",
                               @"unitedhealthcaredental-unitedhealthcaredentalppo",
                               @"unityhealthinsurance-unityhealthinsunitynetwork",
                               @"vsp-vsp",
                               @"wellmarkbluecrossandblueshield-wellmarkallianceselect",
                               @"westernhealthadvantage-westernhealthadvantage",
                               @"wisconsinphysiciansserviceinsurancecorporation-wps"];
    
    self.insuranceProvider.maxNumberOfResults = 4;
    [self.insuranceProvider filterStrings:providersList];
}


@end
