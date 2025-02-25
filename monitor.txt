from pathlib import Path
import shutil
from datetime import datetime

def copy_and_rename_png_files_for_today(source_dir, monitor_dir):
    """
    Copy PNG files from subfolders named as today's date in the source directory to the monitor directory.
    Prepends the folder (date) name and all nested subfolders to the file name.

    :param source_dir: Path to the source directory containing date-named subfolders.
    :param monitor_dir: Path to the monitor directory where files will be saved.
    """
    source_path = Path(source_dir)
    monitor_path = Path(monitor_dir)
    monitor_path.mkdir(parents=True, exist_ok=True)

    # Get today's date in YYYY-MM-DD format
    today_date = datetime.today().strftime('%Y-%m-%d')

    for folder in source_path.iterdir():
        if folder.is_dir() and folder.name == today_date:  # Only process today's folder
            for file in folder.rglob("*.png"):  # Recursively find PNG files
                # Get the path from the date folder to the file's parent folder
                relative_path_parts = file.parent.relative_to(folder).parts
                # Create a string by joining the path parts with underscores
                path_part_str = "_".join(relative_path_parts) if relative_path_parts else "no_subfolder"

                # Create a new file name
                new_file_name = f"{folder.name}_{path_part_str}_{file.name}"

                # Define the target file path in the monitor directory
                target_file = monitor_path / new_file_name

                # Copy the file
                shutil.copyfile(file, target_file)
                print(f"Copied: {file} -> {target_file}")

# Configure your directories
source_directory = r"C:\xampp\htdocs\cu_portal_print_screenshot"  # Replace with your source directory
monitor_directory = r"C:\xampp\htdocs\cu_portal_print_screenshot\monitor"  # Replace with your monitor directory

copy_and_rename_png_files_for_today(source_directory, monitor_directory)