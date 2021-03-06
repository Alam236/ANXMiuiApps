package miui.upnp.typedef.device;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import miui.upnp.typedef.field.FieldList;

public class Subscription implements Parcelable {
    public static final Creator<Subscription> CREATOR = new Creator<Subscription>() {
        public Subscription createFromParcel(Parcel in) {
            return new Subscription(in);
        }

        public Subscription[] newArray(int size) {
            return new Subscription[size];
        }
    };
    private FieldList fields = new FieldList();
    private Service service;

    public Service getService() {
        return this.service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public String getCallbackUrl() {
        return (String) this.fields.getValue(SubscriptionDefinition.CallbackUrl);
    }

    public boolean setCallbackUrl(String url) {
        return this.fields.setValue(SubscriptionDefinition.CallbackUrl, (Object) url);
    }

    public String getSubscriptionId() {
        return (String) this.fields.getValue(SubscriptionDefinition.SubscriptionId);
    }

    public boolean setSubscriptionId(String id) {
        return this.fields.setValue(SubscriptionDefinition.SubscriptionId, (Object) id);
    }

    public int getTimeout() {
        return ((Integer) this.fields.getValue(SubscriptionDefinition.Timeout)).intValue();
    }

    public boolean setTimeout(int timeout) {
        return this.fields.setValue(SubscriptionDefinition.Timeout, Integer.valueOf(timeout));
    }

    public Subscription() {
        initialize();
    }

    private void initialize() {
        this.fields.initField(SubscriptionDefinition.CallbackUrl, null);
        this.fields.initField(SubscriptionDefinition.SubscriptionId, null);
        this.fields.initField(SubscriptionDefinition.Timeout, null);
    }

    public Subscription(Parcel in) {
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
