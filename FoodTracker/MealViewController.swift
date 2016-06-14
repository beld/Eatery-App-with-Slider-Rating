import UIKit
import AMTagListView
import SCLAlertView

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: Properties
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var tasteSlider: UISlider!
    @IBOutlet weak var healthSlider: UISlider!
    @IBOutlet weak var fatSlider: UISlider!
    @IBOutlet weak var carbSlider: UISlider!
    @IBOutlet weak var calorySlider: UISlider!
    @IBOutlet weak var energyDensitySlider: UISlider!
    @IBOutlet weak var difficultySlider: UISlider!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var sugarSlider: UISlider!
    @IBOutlet weak var vitaminSlider: UISlider!
    @IBOutlet weak var fibreSlider: UISlider!
    @IBOutlet weak var tasteLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var caloryLabel: UILabel!
    @IBOutlet weak var energyDensityLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sugarLabel: UILabel!
    @IBOutlet weak var vitaminLabel: UILabel!
    @IBOutlet weak var fibreLabel: UILabel!
    @IBOutlet weak var tasteButton: UIButton!
    
    var meal: Meal?
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tagListView: AMTagListView!
    @IBAction func addTag(sender: AnyObject) {
        let tag = ["gesund"]
        
        RRTagController.displayTagController(self, tagsString: tag, blockFinish: { (selectedTags, unSelectedTags) -> () in
            // the user finished the selection and returns the separated list Selected and not selected.
            for tag in selectedTags {
                print(tag.textContent)
                self.tagListView.addTag(tag.textContent)
            }
            
        }) { () -> () in
            // here the user cancel the selection, nothing is returned.
        }
    }
    
    @IBAction func tasteValueChanged(sender: AnyObject) {
        tasteLabel.text = String(format: "%.0f/100", tasteSlider.value)
    }
    @IBAction func healthValueChanged(sender: AnyObject) {
        healthLabel.text = String(format: "%.0f/100", healthSlider.value)
    }
    @IBAction func fatValueChanged(sender: AnyObject) {
        fatLabel.text = String(format: "%.0f/100", fatSlider.value)
    }
    @IBAction func carbValueChanged(sender: AnyObject) {
        carbLabel.text = String(format: "%.0f/100", carbSlider.value)
    }
    
    @IBAction func caloryValuedChanged(sender: AnyObject) {
        caloryLabel.text = String(format: "%.0f Kalorien", calorySlider.value)
    }
    @IBAction func energyDensityValueChanged(sender: AnyObject) {
        energyDensityLabel.text = String(format: "%.0f kcal/gram", energyDensitySlider.value)
    }
    @IBAction func difficultyValueChanged(sender: AnyObject) {
        difficultyLabel.text = String(format: "%.0f/100", difficultySlider.value)
    }
    @IBAction func timeValueChanged(sender: AnyObject) {
        timeLabel.text = String(format: "%.0f Min.", timeSlider.value)
    }
    
    @IBAction func sugarValueChanged(sender: AnyObject) {
        sugarLabel.text = String(format: "%.0f/100", sugarSlider.value)
    }
    
    @IBAction func vitaminValueChanged(sender: AnyObject) {
        vitaminLabel.text = String(format: "%.0f/100", vitaminSlider.value)
    }
    
    @IBAction func fibreValueChanged(sender: AnyObject) {
        fibreLabel.text = String(format: "%.0f/100", fibreSlider.value)
    }
    
    @IBAction func tasteButton(sender: AnyObject) {
        let alert = SCLAlertView()
        alert.showInfo("Geschmack", subTitle: "Bitte den Geschmack diese Gericht nach Ihren Gunsten bewerten, von 0 bis 100")
    }
    
    @IBAction func healthButton(sender: AnyObject) {
        let alert = SCLAlertView()
        alert.showInfo("Gesundheit", subTitle: "Wie gesund ist diese Gericht in Ihrer Meinung, von 0 bis 100")
    }
    
    @IBAction func fatButton(sender: AnyObject) {
        let alert = SCLAlertView()
        alert.showInfo("Fett", subTitle: "Bitte bewerten Sie das Fett dieses Gericht Ihrer Meinung nach, von 0 bis 100")
    }
    
    @IBAction func carbButton(sender: AnyObject) {
        let alert = SCLAlertView()
        alert.showInfo("Kohlenhydrate", subTitle: "Bitte bewerten Sie das Kohlenhydrat dieses Gericht Ihrer Meinung nach, von 0 bis 100")
    }
    
    @IBAction func caloryButton(sender: AnyObject) {
        let alert = SCLAlertView()
        alert.showInfo("Kalorien", subTitle: "Bitte bewerten Sie die Kalorien dieses Gericht Ihrer Meinung nach, von 0 bis 100")
    }
    
    @IBAction func energyDensityButton(sender: AnyObject) {
        let alert = SCLAlertView()
        alert.showInfo("Energiedichte", subTitle: "Bitte bewerten Sie die Energiedichte (Kilokalorien pro Gramm) dieses Gericht Ihrer Meinung nach")
    }
    
    @IBAction func difficultyButton(sender: AnyObject) {
        let alert = SCLAlertView()
        alert.showInfo("Schwierigkeit", subTitle: "Bitte bewerten Sie den Schwierigkeitsgrad dieses Mahl zu bereiten, von 0 bis 100")
    }
    
    @IBAction func timeButton(sender: AnyObject) {
        let alert = SCLAlertView()
        alert.showInfo("Zeit", subTitle: "Bitte bewerten Sie die Zeit, die Sie brauchen diese Mahlzeit zu bereiten, von 0 bis 180 Mins")
    }
    
    @IBAction func sugarButton(sender: AnyObject) {
        let alert = SCLAlertView()
        alert.showInfo("Zucker", subTitle: "Bitte bewerten Sie den Zucker dieses Gericht Ihrer Meinung nach, von 0 bis 100")
    }
    @IBAction func vitaminButton(sender: AnyObject) {
        let alert = SCLAlertView()
        alert.showInfo("Vitamine", subTitle: "Bitte bewerten Sie die Vitamine dieses Gericht Ihrer Meinung nach, von 0 bis 100")
    }
    @IBAction func fibreButton(sender: AnyObject) {
        let alert = SCLAlertView()
        alert.showInfo("Ballaststoffe", subTitle: "Bitte bewerten Sie die Ballaststoffe dieses Gericht Ihrer Meinung nach, von 0 bis 100")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置NavigationBar为透明
        self.navigationController?.navigationBar.lt_setBackgroundColor(UIColor(red: 1/255.0, green: 131/255.0, blue: 209/255.0, alpha: 1))
        
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "ChalkboardSE-Bold", size: 15)!,
                NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        // set up views if editing an existing meal
        if let existingMeal = meal {
            navigationItem.title = existingMeal.name
            nameTextField.text = existingMeal.name
            photoImageView.image = existingMeal.photo
            tasteSlider.value = existingMeal.tasteRating
            tasteSlider.thumbTintColor = tasteButton.tintColor
            tasteLabel.text = String(format: "%.0f/100", existingMeal.tasteRating)
            
            healthSlider.value = existingMeal.healthRating
            healthLabel.text = String(format: "%.0f/100", existingMeal.healthRating)
            healthSlider.thumbTintColor = tasteButton.tintColor
            
            fatSlider.value = existingMeal.fatRating
            fatSlider.thumbTintColor = tasteButton.tintColor
            fatLabel.text = String(format: "%.0f/100", fatSlider.value)
            
            carbSlider.value = existingMeal.carbRating
            carbSlider.thumbTintColor = tasteButton.tintColor
            carbLabel.text = String(format: "%.0f/100", carbSlider.value)
            
            calorySlider.value = existingMeal.caloryRating
            calorySlider.thumbTintColor = tasteButton.tintColor
            caloryLabel.text = String(format: "%.0f Kalorien", calorySlider.value)
            
            energyDensitySlider.value = existingMeal.energyDensityRating
            energyDensitySlider.thumbTintColor = tasteButton.tintColor
            energyDensityLabel.text = String(format: "%.0f kcal/gram", energyDensitySlider.value)
            
            difficultySlider.value = existingMeal.difficultyRating
            difficultySlider.thumbTintColor = tasteButton.tintColor
            difficultyLabel.text = String(format: "%.0f/100", existingMeal.difficultyRating)
            
            timeSlider.value = existingMeal.timeRating
            timeSlider.thumbTintColor = tasteButton.tintColor
            timeLabel.text = String(format: "%.0f Min.", timeSlider.value)
            
            sugarSlider.value = existingMeal.sugarRating
            sugarSlider.thumbTintColor = tasteButton.tintColor
            sugarLabel.text = String(format: "%.0f/100", sugarSlider.value)
            
            vitaminSlider.value = existingMeal.vitaminRating
            vitaminSlider.thumbTintColor = tasteButton.tintColor
            vitaminLabel.text = String(format: "%.0f/100", vitaminSlider.value)
            
            fibreSlider.value = existingMeal.fibreRating
            fibreSlider.thumbTintColor = tasteButton.tintColor
            fibreLabel.text =  String(format: "%.0f/100", fibreSlider.value)
            descriptionTextView.text = existingMeal.cookingDescription
        }
        
        descriptionTextView.sizeToFit()
        
        // enable save button only if text field has valid name
        checkValidMealName()
        
        AMTagView.appearance().tagLength = 10
        AMTagView.appearance().textFont = UIFont(name: "Futura", size: 14)
        AMTagView.appearance().tagColor = UIColor(red:0.12, green:0.55, blue:0.84, alpha:1)
        tagListView.addTag("Gericht")
    }
    
    // MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable save button while editing
        saveButton.enabled = false
    }
    
    func checkValidMealName() {
        // disable the save button if text field is empty
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
        navigationItem.title = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Navigation
    @IBAction func cancel(sender: UIBarButtonItem) {
        // depending on style of presentation (modal or push), this view
        // controller needs to be dismissed in 2 different ways
        
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }
        
    }
    // configure a view controller before it's passed
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let cookingDescription = descriptionTextView.text ?? ""
            let tasteRating = Float(tasteSlider.value)
            let healthRating = healthSlider.value
            let fatRating = fatSlider.value
            let carbRating = carbSlider.value
            let caloryRating = calorySlider.value
            let energyDensityRating = energyDensitySlider.value
            let sugarRating = sugarSlider.value
            let vitaminRating = vitaminSlider.value
            let fibreRating = fibreSlider.value
            let difficultyRating = difficultySlider.value
            let timeRating = timeSlider.value
            
            // set meal to be passed to MealTableViewController after unwind segue
            meal = Meal(name: name, photo: photo, tasteRating:tasteRating, healthRating: healthRating, fatRating: fatRating, carbRating: carbRating, caloryRating: caloryRating, energyDensityRating: energyDensityRating, sugarRating: sugarRating, vitaminRating: vitaminRating, fibreRating: fibreRating, difficultyRating: difficultyRating, timeRating: timeRating, cookingDescription: cookingDescription, elapsedRatingTime: 0)
        }
    }
    
    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
}
