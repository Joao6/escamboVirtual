package escambovirtual.util;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Joao
 */
public class FileUploadForm {
    
    List<MultipartFile> files;

    public List<MultipartFile> getFiles() {
        return files;
    }

    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }
}
