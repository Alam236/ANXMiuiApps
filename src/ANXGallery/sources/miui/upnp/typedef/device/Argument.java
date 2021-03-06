package miui.upnp.typedef.device;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import miui.upnp.typedef.field.FieldList;

public class Argument implements Parcelable {
    public static final Creator<Argument> CREATOR = new Creator<Argument>() {
        public Argument createFromParcel(Parcel in) {
            return new Argument(in);
        }

        public Argument[] newArray(int size) {
            return new Argument[size];
        }
    };
    private FieldList fields = new FieldList();

    public enum Direction {
        UNDEFINED,
        IN,
        OUT;
        
        private static final String STR_in = "in";
        private static final String STR_out = "out";
        private static final String STR_undefined = "undefined";

        public static Direction retrieveType(String value) {
            if (value.equals(STR_undefined)) {
                return UNDEFINED;
            }
            if (value.equals(STR_in)) {
                return IN;
            }
            if (value.equals(STR_out)) {
                return OUT;
            }
            return UNDEFINED;
        }

        public String toString() {
            switch (this) {
                case IN:
                    return STR_in;
                case OUT:
                    return STR_out;
                default:
                    return STR_undefined;
            }
        }
    }

    public Argument(String name, Direction direction, String relatedStateVariable) {
        initialize();
        setName(name);
        setDirection(direction);
        setRelatedProperty(relatedStateVariable);
    }

    public Argument(String name, String direction, String relatedStateVariable) {
        initialize();
        setName(name);
        setDirection(direction);
        setRelatedProperty(relatedStateVariable);
    }

    public String getName() {
        return (String) this.fields.getValue(ArgumentDefinition.Name);
    }

    public boolean setName(String name) {
        return this.fields.setValue(ArgumentDefinition.Name, (Object) name);
    }

    public Direction getDirection() {
        return Direction.retrieveType((String) this.fields.getValue(ArgumentDefinition.Direction));
    }

    public boolean setDirection(Direction direction) {
        return setDirection(direction.toString());
    }

    public boolean setDirection(String direction) {
        return this.fields.setValue(ArgumentDefinition.Direction, (Object) direction);
    }

    public String getRelatedProperty() {
        return (String) this.fields.getValue(ArgumentDefinition.RelatedProperty);
    }

    public boolean setRelatedProperty(String relatedStateVariable) {
        return this.fields.setValue(ArgumentDefinition.RelatedProperty, (Object) relatedStateVariable);
    }

    public Argument() {
        initialize();
    }

    private void initialize() {
        this.fields.initField(ArgumentDefinition.Name, null);
        this.fields.initField(ArgumentDefinition.Direction, null);
        this.fields.initField(ArgumentDefinition.RelatedProperty, null);
    }

    public Argument(Parcel in) {
        initialize();
        readFromParcel(in);
    }

    public void readFromParcel(Parcel in) {
        this.fields = (FieldList) in.readParcelable(FieldList.class.getClassLoader());
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        out.writeParcelable(this.fields, flags);
    }
}
